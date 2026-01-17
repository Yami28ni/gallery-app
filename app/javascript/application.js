import "@hotwired/turbo-rails"
import "controllers"
import "sidebar"
import "dropdown"
document.addEventListener("turbo:load", () => {

  //Tags logic (new + existing) 
  const input = document.getElementById("tag-input");
  const tagList = document.getElementById("tag-list");
  const hiddenTags = document.getElementById("hidden-tags");

  if (!input || !hiddenTags) return;

  let tagIndex = hiddenTags.children.length;

  input.closest("form")?.addEventListener("submit", (e) => {
    if (document.activeElement === input) {
      e.preventDefault();
    }
  });

  input.addEventListener("keydown", (e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      e.stopPropagation();

      const value = input.value.trim();
      if (!value) return;

      const chip = document.createElement("div");
      chip.className =
        "inline-flex items-center gap-2 bg-gray-700 text-white px-3 py-1 rounded-full text-sm";

      const text = document.createElement("span");
      text.textContent = value;

      const removeBtn = document.createElement("button");
      removeBtn.type = "button";
      removeBtn.innerHTML = "&times;";
      removeBtn.className =
        "text-white/80 hover:text-white font-bold leading-none";

      const hiddenInput = document.createElement("input");
      hiddenInput.type = "hidden";
      hiddenInput.name = `album[tags_attributes][${tagIndex}][name]`;
      hiddenInput.value = value;

      removeBtn.addEventListener("click", () => {
        chip.remove();
        hiddenInput.remove();
      });

      chip.append(text, removeBtn);
      tagList.appendChild(chip);
      hiddenTags.appendChild(hiddenInput);

      tagIndex++;
      input.value = "";
    }
  });
});


  //Existing tag delete
  window.removeExistingTag = function (index) {
  document.querySelector(`[data-index="${index}"]`)?.remove();


  const destroyInput = document.getElementById(`destroy-tag-${index}`);
  if (destroyInput) {
    destroyInput.value = "1";
  }
};

document.addEventListener("turbo:load", () => {
  const modal = document.getElementById("image-modal");
  const modalImage = document.getElementById("modal-image");
  const closeBtn = document.getElementById("close-modal");
  console.log("Image modal script loaded");
  if (!modal) return;

  document.querySelectorAll(".preview-image").forEach(image => {
    image.addEventListener("click", () => {
      modalImage.src = image.dataset.imageUrl;
      modal.classList.remove("hidden");
      modal.classList.add("flex");
    });
  });

  closeBtn.addEventListener("click", closeModal);

  modal.addEventListener("click", (e) => {
    if (e.target === modal) closeModal();
  });

  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") closeModal();
  });

  function closeModal() {
    modal.classList.add("hidden");
    modal.classList.remove("flex");
    modalImage.src = "";
  }
});


