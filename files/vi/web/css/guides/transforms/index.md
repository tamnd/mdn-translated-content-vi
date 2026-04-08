---
title: CSS transforms
short-title: Transforms
slug: Web/CSS/Guides/Transforms
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-transforms/
  - https://drafts.csswg.org/css-transforms-2/
sidebar: cssref
---

Module **CSS transforms** định nghĩa cách các phần tử được tạo kiểu bằng CSS có thể được biến đổi trong không gian hai chiều hoặc ba chiều.

## CSS transforms trong thực tế

Sử dụng các thanh trượt trong ví dụ bên dưới để thay đổi các thuộc tính CSS transform gồm translation, rotation, scale và skew của khối lập phương trong không gian 3D. Khi bạn di chuyển khối lập phương trong không gian 3D, hãy để ý cách nó tương tác với phần tử có nhãn `z:0px`, nằm tại vị trí 3D `(0, 0, 0)`.

```html hidden live-sample___transforms
<article>
  <fieldset id="allTransformFieldset">
    <legend>
      Transform settings
      <button id="resetAllButton" aria-label="Reset">↻</button>
    </legend>
    <section id="fieldsetSection">
      <fieldset class="transformFieldset">
        <legend>
          <label>
            <span>Translation</span>
          </label>
          <button
            id="translateSectionReset"
            class="resetSectionButton"
            aria-label="Reset">
            ↻
          </button>
        </legend>
        <div class="controlsContainer">
          <div>
            <label>
              <span id="translateXLabel">X</span>
              <input
                type="range"
                min="-100"
                max="100"
                value="0"
                data-default="0"
                id="translateXRange"
                aria-labelledby="translateXLabel" />
            </label>
            <output id="translateXOutput" for="translateXRange"></output>
          </div>
          <div>
            <label>
              <span id="translateYLabel">Y</span>
              <input
                type="range"
                min="-100"
                max="100"
                value="0"
                data-default="0"
                id="translateYRange"
                aria-labelledby="translateYLabel" />
            </label>
            <output id="translateYOutput" for="translateYRange"></output>
          </div>
          <div>
            <label>
              <span id="translateZLabel">Z</span>
              <input
                type="range"
                min="-100"
                max="100"
                value="0"
                data-default="0"
                id="translateZRange"
                aria-labelledby="translateZLabel" />
            </label>
            <output id="translateZOutput" for="translateZRange"></output>
          </div>
        </div>
      </fieldset>

      <fieldset class="transformFieldset">
        <legend>
          <label>
            <span>Rotation</span>
          </label>
          <button
            id="rotateSectionReset"
            class="resetSectionButton"
            aria-label="Reset">
            ↻
          </button>
        </legend>
        <div class="controlsContainer">
          <div>
            <label>
              <span id="rotateXLabel">X</span>
              <input
                type="range"
                min="-360"
                max="360"
                value="0"
                data-default="0"
                id="rotateXRange"
                aria-labelledby="rotateXLabel" />
            </label>
            <output id="rotateXOutput" for="rotateXRange"></output>
          </div>
          <div>
            <label>
              <span id="rotateYLabel">Y</span>
              <input
                type="range"
                min="-360"
                max="360"
                value="0"
                data-default="0"
                id="rotateYRange"
                aria-labelledby="rotateYLabel" />
            </label>
            <output id="rotateYOutput" for="rotateYRange"></output>
          </div>
          <div>
            <label>
              <span id="rotateZLabel">Z</span>
              <input
                type="range"
                min="-360"
                max="360"
                value="0"
                data-default="0"
                id="rotateZRange"
                aria-labelledby="rotateZLabel" />
            </label>
            <output id="rotateZOutput" for="rotateZRange"></output>
          </div>
        </div>
      </fieldset>

      <fieldset class="transformFieldset">
        <legend>
          <label>
            <span>Scale</span>
          </label>
          <button
            id="scaleSectionReset"
            class="resetSectionButton"
            aria-label="Reset">
            ↻
          </button>
        </legend>
        <div class="controlsContainer">
          <div>
            <label>
              <span id="scaleXLabel">X</span>
              <input
                type="range"
                min="0.1"
                max="2.5"
                value="1"
                data-default="1"
                step="0.1"
                id="scaleXRange"
                aria-labelledby="scaleXLabel" />
            </label>
            <output id="scaleXOutput" for="scaleXRange"></output>
          </div>
          <div>
            <label id="scaleYLabel">
              <span>Y</span>
              <input
                type="range"
                min="0.1"
                max="2.5"
                value="1"
                data-default="1"
                step="0.1"
                id="scaleYRange"
                aria-labelledby="scaleYLabel" />
            </label>
            <output id="scaleYOutput" for="scaleYRange"></output>
          </div>
          <div>
            <label id="scaleZLabel">
              <span>Z</span>
              <input
                type="range"
                min="0.1"
                max="2.5"
                value="1"
                data-default="1"
                step="0.1"
                id="scaleZRange"
                aria-labelledby="scaleZLabel" />
            </label>
            <output id="scaleZOutput" for="scaleZRange"></output>
          </div>
        </div>
      </fieldset>

      <fieldset class="transformFieldset">
        <legend>
          <label>
            <span>Skew</span>
          </label>
          <button
            id="skewSectionReset"
            class="resetSectionButton"
            aria-label="Reset">
            ↻
          </button>
        </legend>
        <div class="controlsContainer">
          <div>
            <label>
              <span id="skewXLabel">X</span>
              <input
                type="range"
                min="-90"
                max="90"
                value="0"
                data-default="0"
                id="skewXRange"
                aria-labelledby="skewXLabel" />
            </label>
            <output id="skewXOutput" for="skewXRange"></output>
          </div>
          <div>
            <label>
              <span id="skewYLabel">Y</span>
              <input
                type="range"
                min="-90"
                max="90"
                value="0"
                data-default="0"
                id="skewYRange"
                aria-labelledby="skewYLabel" />
            </label>
            <output id="skewYOutput" for="skewYRange"></output>
          </div>
        </div>
      </fieldset>

      <fieldset class="transformFieldset">
        <legend>
          <label>
            <span>Container Perspective</span>
          </label>
          <button
            id="containerPerspectiveSectionReset"
            class="resetSectionButton"
            aria-label="Reset">
            ↻
          </button>
        </legend>
        <div class="controlsContainer">
          <div>
            <label>
              <span id="perspectiveLabel"><code>perspective</code></span>
              <input
                type="range"
                min="75"
                max="500"
                value="200"
                data-default="200"
                id="perspectiveRange"
                aria-labelledby="perspectiveLabel" />
            </label>
            <output id="perspectiveOutput" for="perspectiveRange"></output>
          </div>
          <div>
            <label>
              <span id="perspectiveOriginXLabel"
                ><code>perspective-origin</code> X (%)</span
              >
              <input
                type="range"
                min="0"
                max="100"
                value="50"
                data-default="50"
                id="perspectiveOriginXRange"
                aria-labelledby="perspectiveOriginXLabel" />
            </label>
            <output
              id="perspectiveOriginXOutput"
              for="perspectiveOriginXRange"></output>
          </div>
          <div>
            <label>
              <span><code>perspective-origin</code> Y (%)</span>
              <input
                type="range"
                min="0"
                max="100"
                value="50"
                data-default="50"
                id="perspectiveOriginYRange"
                aria-labelledby="perspectiveOriginYLabel" />
            </label>
            <output
              id="perspectiveOriginYOutput"
              for="perspectiveOriginYRange"></output>
          </div>
        </div>
      </fieldset>

      <fieldset class="transformFieldset">
        <legend>
          <label>
            <span>Other Properties</span>
          </label>
          <button
            id="otherSectionReset"
            class="resetSectionButton"
            aria-label="Reset">
            ↻
          </button>
        </legend>
        <div class="controlsContainer">
          <div>
            <label>
              <span><code>backface-visibility</code></span>
              <input
                type="checkbox"
                checked
                data-default="checked"
                id="backfaceVisibilityCheckbox" />
            </label>
          </div>
        </div>
      </fieldset>
    </section>
  </fieldset>
  <section id="outputSection">
    <div id="outputContainer">
      <div id="cube">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
      <div id="z0"><code>z:0px</code></div>
    </div>
    <div id="perspectiveDot"></div>
  </section>
</article>
```

```css hidden live-sample___transforms
#allTransformFieldset {
  border: none;
  padding: 0;
  margin-bottom: 4px;
  accent-color: blue; /* or any color */
  font-family:
    "Inter", "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans",
    "Droid Sans", "Helvetica Neue", sans-serif;
}

#allTransformFieldset > legend {
  margin-bottom: 4px;
}

fieldset {
  margin: 0;
}

legend {
  font-weight: bold;
  padding: 0;
}

#fieldsetSection {
  display: flex;
  flex-wrap: wrap;
  align-items: start;
  gap: 8px;
}

#outputSection {
  width: 100%;
  min-height: 400px;
  background: linear-gradient(skyblue, khaki);
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: clip;
}

#outputContainer {
  position: absolute;
  width: 100%;
  height: 100%;
  perspective: 200px;
  display: flex;
  justify-content: center;
  align-items: center;
  transform-style: preserve-3d;
  pointer-events: none;
}

#z0 {
  width: 50px;
  height: 50px;
  background: linear-gradient(
    to right bottom,
    rgb(223 223 223),
    rgb(190 190 190)
  );
  transform: translateZ(0px);
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 14px;
  color: black;
  border-radius: 50%;
  outline: 1px solid rgb(0 0 0 / 0.35);
  pointer-events: all;
}

#perspectiveDot {
  width: 4px;
  height: 4px;
  border-radius: 50%;
  background-color: rgb(240 0 0 / 0.5);
  transform: translate3d(-2px, -2px, 0px);
  position: absolute;
}

#cube {
  width: 100px;
  height: 100px;
  transform-style: preserve-3d;
  transition: all 0.075s ease-out;
  position: absolute;
  pointer-events: all;
}

.face {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
  position: absolute;
  backface-visibility: inherit;
  font-size: 60px;
  color: white;
}

.front {
  background: rgb(90 90 90 / 0.7);
  transform: translateZ(50px);
}

.back {
  background: rgb(0 210 0 / 0.7);
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(210 0 0 / 0.7);
  transform: rotateY(90deg) translateZ(50px);
}

.left {
  background: rgb(0 0 210 / 0.7);
  transform: rotateY(-90deg) translateZ(50px);
}

.top {
  background: rgb(210 210 0 / 0.7);
  transform: rotateX(90deg) translateZ(50px);
}

.bottom {
  background: rgb(210 0 210 / 0.7);
  transform: rotateX(-90deg) translateZ(50px);
}

.transformFieldset {
  margin: 0;
}

.controlsContainer {
  display: flex;
  flex-direction: column;
  align-items: start;
  gap: 4px;
}

.controlsContainer {
  width: 100%;
}

.controlsContainer > div {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 4px;
}

.controlsContainer > div > label {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 4px;
}

button {
  font-size: 18px;
  border-radius: 50%;
  border: #cccccc solid 1px;
  padding: 0;
  width: 26px;
  height: 26px;
  margin-left: 4px;
}

input[type="range"] {
  width: 172px;
}

output {
  width: 3em;
}
```

```js hidden live-sample___transforms
allTransformFieldset
  .querySelectorAll("input[type='range']")
  .forEach((rangeInput) => {
    // Event listeners for when the range inputs change
    rangeInput.addEventListener("input", (el) => {
      updateTransform();
    });

    // Reset the relevant transform setting when the range input is double clicked
    rangeInput.addEventListener("dblclick", (el) => {
      resetInput(el.target);
      updateTransform();
    });
  });

// Event listeners for when checkbox inputs change
allTransformFieldset
  .querySelectorAll("input[type='checkbox']")
  .forEach((checkboxInput) => {
    checkboxInput.addEventListener("input", (el) => {
      updateTransform();
    });
  });

// "Reset All" button event listener
resetAllButton.addEventListener("click", () => {
  allTransformFieldset.querySelectorAll("input").forEach((input) => {
    resetInput(input);
  });
  updateTransform();
});

// Section reset button event listeners
allTransformFieldset
  .querySelectorAll(".resetSectionButton")
  .forEach((resetSectionButton) => {
    resetSectionButton.addEventListener("click", (el) => {
      let allRanges = el.target.parentElement.parentElement.querySelectorAll(
        "input[type='range']",
      );
      allRanges.forEach((range) => {
        resetInput(range);
      });

      let allCheckboxes =
        el.target.parentElement.parentElement.querySelectorAll(
          "input[type='checkbox']",
        );
      allCheckboxes.forEach((check) => {
        resetInput(check);
      });

      updateTransform();
    });
  });

function resetInput(inputEl) {
  if (!inputEl) {
    console.warn(`inputEl \`${inputEl}\` is falsy!`);
    console.trace();
    return;
  }

  const defaultValue = inputEl.getAttribute("data-default");
  if (inputEl.getAttribute("type") === "checkbox") {
    inputEl.checked = defaultValue === "checked";
  } else {
    inputEl.value = defaultValue || "0";
  }
}

function updateOutputs() {
  translateXOutput.value = `${translateXRange.value}px`;
  translateYOutput.value = `${translateYRange.value}px`;
  translateZOutput.value = `${translateZRange.value}px`;

  rotateXOutput.value = `${rotateXRange.value}°`;
  rotateYOutput.value = `${rotateYRange.value}°`;
  rotateZOutput.value = `${rotateZRange.value}°`;

  scaleXOutput.value = `${scaleXRange.value}x`;
  scaleYOutput.value = `${scaleYRange.value}x`;
  scaleZOutput.value = `${scaleZRange.value}x`;

  skewXOutput.value = `${skewXRange.value}°`;
  skewYOutput.value = `${skewYRange.value}°`;

  perspectiveOutput.value = `${perspectiveRange.value}px`;

  perspectiveOriginXOutput.value = `${perspectiveOriginXRange.value}%`;
  perspectiveOriginYOutput.value = `${perspectiveOriginYRange.value}%`;
}

function updateTransform() {
  updateOutputs();

  cube.style.transform = `translate3d(${translateXRange.value}px,
                ${translateYRange.value}px,
                ${translateZRange.value}px)
                rotateX(${rotateXRange.value}deg)
                rotateY(${rotateYRange.value}deg)
                rotateZ(${rotateZRange.value}deg)
                scale3d(${scaleXRange.value},
                ${scaleYRange.value},
                ${scaleZRange.value})
                skewX(${skewXRange.value}deg)
                skewY(${skewYRange.value}deg)`;
  cube.style.backfaceVisibility = `${backfaceVisibilityCheckbox.checked ? "visible" : "hidden"}`;

  outputContainer.style.perspective = `${perspectiveRange.value}px`;
  outputContainer.style.perspectiveOrigin = `${perspectiveOriginXRange.value}% ${perspectiveOriginYRange.value}%`;

  perspectiveDot.style.top = `${perspectiveOriginYRange.value}%`;
  perspectiveDot.style.left = `${perspectiveOriginXRange.value}%`;
}
updateTransform();
```

{{EmbedLiveSample("transforms", "", "850px")}}

Bạn cũng có thể dùng thanh trượt `perspective` để thay đổi thuộc tính {{cssxref("perspective")}} của container chứa khối lập phương, xác định khoảng cách giữa bạn và mặt phẳng `z=0`.

Các thanh trượt {{cssxref("perspective-origin")}} xác định vị trí bạn — người xem — đang nhìn vào không gian 3D để xác định _điểm biến mất_ của góc nhìn. Điểm biến mất này được biểu thị bằng một dấu chấm đỏ nhỏ. Bạn có thể hình dung việc điều chỉnh các thanh trượt này như việc di chuyển đầu lên, xuống, trái, phải để nhìn thấy các góc khác nhau của khối lập phương mà không di chuyển chính khối lập phương.

Hộp kiểm `backface-visibility` xác định mặt sau của khối lập phương được đặt thành `visible` hay `hidden`.

Khối lập phương trong ví dụ trên được tạo từ sáu phần tử `<div>`, tất cả đều được tạo kiểu bằng CSS để tạo thành các mặt của khối lập phương. Khối lập phương không được vẽ bằng canvas context 2D hay 3D, vì vậy **bạn có thể kiểm tra các mặt của khối lập phương bằng công cụ dành cho nhà phát triển của trình duyệt như bất kỳ phần tử DOM nào khác**. Hãy thử dùng công cụ chọn phần tử của trình duyệt để kiểm tra các mặt khác nhau của khối lập phương khi bạn thay đổi vị trí và góc xoay của nó.

> [!NOTE]
> Thứ tự áp dụng các phép biến đổi, bao gồm cả xoay 3D, ảnh hưởng đến kết quả biến đổi cuối cùng. Trong ví dụ trên, các phép biến đổi được áp dụng theo thứ tự: translate (dịch chuyển), scale (tỷ lệ), rotate (xoay), rồi skew (nghiêng). Các phép xoay được áp dụng theo thứ tự X → Y → Z.

## Tham khảo

### Thuộc tính

- {{cssxref("backface-visibility")}}
- {{cssxref("perspective")}}
- {{cssxref("perspective-origin")}}
- {{cssxref("rotate")}}
- {{cssxref("scale")}}
- {{cssxref("transform")}}
- {{cssxref("transform-box")}}
- {{cssxref("transform-origin")}}
- {{cssxref("transform-style")}}
- {{cssxref("translate")}}

### Hàm

- {{cssxref("transform-function/matrix", "matrix()")}}
- {{cssxref("transform-function/matrix3d", "matrix3d()")}}
- {{cssxref("transform-function/perspective", "perspective()")}}
- {{cssxref("transform-function/rotate", "rotate()")}}
- {{cssxref("transform-function/rotate3d", "rotate3d()")}}
- {{cssxref("transform-function/rotateX", "rotateX()")}}
- {{cssxref("transform-function/rotateY", "rotateY()")}}
- {{cssxref("transform-function/rotateZ", "rotateZ()")}}
- {{cssxref("transform-function/scale", "scale()")}}
- {{cssxref("transform-function/scale3d", "scale3d()")}}
- {{cssxref("transform-function/scaleX", "scaleX()")}}
- {{cssxref("transform-function/scaleY", "scaleY()")}}
- {{cssxref("transform-function/scaleZ", "scaleZ()")}}
- {{cssxref("transform-function/skew", "skew()")}}
- {{cssxref("transform-function/skewX", "skewX()")}}
- {{cssxref("transform-function/skewY", "skewY()")}}
- {{cssxref("transform-function/translate", "translate()")}}
- {{cssxref("transform-function/translate3d", "translate3d()")}}
- {{cssxref("transform-function/translateX", "translateX()")}}
- {{cssxref("transform-function/translateY", "translateY()")}}
- {{cssxref("transform-function/translateZ", "translateZ()")}}

### Kiểu dữ liệu

- {{cssxref("&lt;transform-function&gt;")}}

## Hướng dẫn

- [Sử dụng CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using)
  - : Hướng dẫn từng bước về cách biến đổi các phần tử được tạo kiểu bằng CSS.
- [Hệ tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems)
  - : Mô tả cách xác định vị trí pixel trong mô hình đối tượng CSS.
- [Cơ bản về hiệu suất: Sử dụng CSS transforms](/en-US/docs/Web/Performance/Guides/Fundamentals#use_css_transforms)
  - : Tổng quan về các nguyên tắc cơ bản của hiệu suất web, bao gồm cách CSS transforms có thể cải thiện hiệu suất.
- [Toán học ma trận cho web](/en-US/docs/Web/API/WebGL_API/Matrix_math_for_the_web)
  - : Mô tả cách các phép biến đổi đối tượng có thể được biểu diễn bằng ma trận toán học.

## Khái niệm liên quan

- Thuộc tính CSS:
  - {{cssxref("animation")}}
  - {{cssxref("background-position")}}
  - {{cssxref("clip")}}
  - {{cssxref("clip-path")}}
  - {{cssxref("contain")}}
  - {{cssxref("content-visibility")}}
  - {{cssxref("isolation")}}
  - {{cssxref("mask")}}
  - {{cssxref("mask-border-source")}}
  - {{cssxref("mask-image")}}
  - {{cssxref("mix-blend-mode")}}
  - {{cssxref("opacity")}}
  - {{cssxref("overflow")}}
  - {{cssxref("transition")}}
  - {{cssxref("visibility")}}
- Kiểu dữ liệu:
  - {{cssxref("angle")}}
  - {{cssxref("length-percentage")}}
  - {{cssxref("length")}}
  - {{cssxref("number")}}
  - {{cssxref("percentage")}}
  - {{cssxref("position")}}
- Thuật ngữ trong bảng chú giải:
  - {{glossary("Interpolation")}}
  - {{glossary("Stacking context")}}
- Các khái niệm [SVG](/en-US/docs/Web/SVG):
  - Phần tử [`<animate>`](/en-US/docs/Web/SVG/Reference/Element/animate)
  - Phần tử [`<animateTransform>`](/en-US/docs/Web/SVG/Reference/Element/animateTransform)
  - Phần tử [`<set>`](/en-US/docs/Web/SVG/Reference/Element/set)
  - Phần tử [`transform`](/en-US/docs/Web/SVG/Reference/Attribute/transform)

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- Hướng dẫn [Các phép biến đổi SVG cơ bản](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations)
- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
- Module [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions)
