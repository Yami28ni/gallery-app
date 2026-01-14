document.addEventListener("turbo:load", () => {
  const openBtn = document.getElementById("sidebar-toggle");
  const closeBtn = document.getElementById("sidebar-close");
  const sidebar = document.getElementById("top-bar-sidebar");

  if (!sidebar) return;

  openBtn?.addEventListener("click", () => {
    sidebar.classList.remove("-translate-x-full");
  });

  closeBtn?.addEventListener("click", () => {
    sidebar.classList.add("-translate-x-full");
  });
});
