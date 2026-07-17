// ========== 添加功能按钮 ==========
function addButtons() {
  const container = document.createElement('div');
  container.id = 'pake-tools';
  container.innerHTML = `
    <button id="pake-export">📄 导出</button>
    <button id="pake-copy">📋 复制全部</button>
  `;

  // 样式
  const style = document.createElement('style');
  style.textContent = `
    #pake-tools {
      position: fixed;
      top: 12px;
      right: 80px;
      z-index: 2147483647;
      display: flex;
      gap: 8px;
    }
    #pake-tools button {
      padding: 6px 14px;
      border: none;
      border-radius: 6px;
      background: #4f46e5;
      color: white;
      font-size: 13px;
      cursor: pointer;
      transition: opacity 0.2s;
    }
    #pake-tools button:hover {
      opacity: 0.9;
    }
  `;

  document.head.appendChild(style);
  document.body.appendChild(container);

  // 绑定事件
  document.getElementById('pake-export').onclick = exportConversation;
  document.getElementById('pake-copy').onclick = copyAll;
}

// ========== 导出功能 ==========
async function exportConversation() {
  const messages = extractMessages();
  const text = formatAsText(messages);

  // 创建下载
  const blob = new Blob([text], { type: 'text/plain' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `deepseek-${new Date().toISOString().slice(0,10)}.md`;
  a.click();
  URL.revokeObjectURL(url);
}

// ========== 复制全部 ==========
async function copyAll() {
  const messages = extractMessages();
  const text = formatAsText(messages);

  await navigator.clipboard.writeText(text);

  // 提示
  const tip = document.createElement('div');
  tip.textContent = '✓ 已复制';
  tip.style.cssText = 'position:fixed;top:56px;right:80px;background:#10b981;color:#fff;padding:6px 14px;border-radius:6px;z-index:2147483647;font-size:13px;';
  document.body.appendChild(tip);
  setTimeout(() => tip.remove(), 1500);
}

// ========== 提取 DeepSeek 对话 ==========
function extractMessages() {
  // DeepSeek 实际选择器（需根据页面调整）
  const selectors = [
    '[data-testid="chat-message"]',
    '.ds-chat-message',
    '.message-item',
    '[class*="message"]'
  ];

  let elements = [];
  for (const sel of selectors) {
    elements = document.querySelectorAll(sel);
    if (elements.length > 0) break;
  }

  return Array.from(elements).map(el => ({
    role: el.classList.contains('user') || el.closest('[data-role="user"]') ? 'user' : 'assistant',
    content: el.innerText.trim(),
    html: el.innerHTML
  }));
}

function formatAsText(messages) {
  return messages.map(m =>
    `**${m.role === 'user' ? '👤 用户' : '🤖 DeepSeek'}**\n\n${m.content}`
  ).join('\n\n---\n\n');
}

// ========== 初始化 ==========
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', addButtons);
} else {
  addButtons();
}
