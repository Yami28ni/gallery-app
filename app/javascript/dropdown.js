document.addEventListener("turbo:load", () => {
  console.log("Dropdown script loaded");
  const buttons = document.querySelectorAll(".album-menu-btn");
  buttons.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.stopPropagation();
      
      document.querySelectorAll(".album-menu").forEach((menu) => {
        if (menu !== btn.nextElementSibling) {
          menu.classList.add("hidden");
        }
      });
      
      btn.nextElementSibling?.classList.toggle("hidden");
    });
  });

  document.addEventListener("click", () => {
    document.querySelectorAll(".album-menu").forEach((menu) => {
      menu.classList.add("hidden");
    });
  });
});
