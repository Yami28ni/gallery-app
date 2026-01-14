document.addEventListener("turbo:load", () => {
  console.log("Dropdown script loaded");
  //Album three-dots dropdown
  const buttons = document.querySelectorAll(".album-menu-btn");
  buttons.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.stopPropagation();

      // close other menus
      document.querySelectorAll(".album-menu").forEach((menu) => {
        if (menu !== btn.nextElementSibling) {
          menu.classList.add("hidden");
        }
      });

      // toggle current
      btn.nextElementSibling?.classList.toggle("hidden");
    });
  });

  document.addEventListener("click", () => {
    document.querySelectorAll(".album-menu").forEach((menu) => {
      menu.classList.add("hidden");
    });
  });
});
