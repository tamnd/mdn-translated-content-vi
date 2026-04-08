---
title: CSS filter effects
short-title: Filter effects
slug: Web/CSS/Guides/Filter_effects
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/filter-effects-2/
  - https://drafts.csswg.org/filter-effects-1/
sidebar: cssref
---

Các thuộc tính trong module **CSS filter effects** cho phép bạn xác định cách xử lý phần hiển thị của một phần tử trước khi phần tử đó được hiển thị trong tài liệu. Ví dụ về các hiệu ứng như vậy bao gồm làm mờ và thay đổi cường độ màu sắc của phần tử.

## Filter effects trong thực tế

Hãy thử kéo các thanh trượt khác nhau để áp dụng filter effects lên hình ảnh bên dưới.

```html hidden live-sample___filters
<article>
  <img
    src="https://mdn.github.io/shared-assets/images/examples/george_floyd_memorial_sm.jpg"
    width="600"
    height="400"
    alt="A colorful memorial honoring George Floyd and the Black Lives Matter movement" />
  <form>
    <fieldset>
      <legend>Select your filters</legend>
      <label>
        <input type="range" name="blur" value="0" min="0" max="1" step="0.1" />
        blur()
      </label>
      <label>
        <input
          type="range"
          name="brightness"
          value="1"
          min="0"
          max="2"
          step="0.1" />
        brightness()
      </label>
      <label>
        <input
          type="range"
          name="contrast"
          value="1"
          min="0"
          max="2"
          step="0.1" />
        contrast()
      </label>
      <label>
        <input
          type="range"
          name="dropShadow"
          value="0"
          min="-1"
          max="1"
          step="0.1" />
        drop-shadow()
      </label>
      <label>
        <input
          type="range"
          name="grayscale"
          value="0"
          min="0"
          max="1"
          step="0.1" />
        grayscale()
      </label>
      <label>
        <input
          type="range"
          name="hueRotate"
          value="0"
          min="-1"
          max="1"
          step="0.1" />
        hue-rotate()
      </label>
      <label>
        <input
          type="range"
          name="invert"
          value="0"
          min="0"
          max="1"
          step="0.1" />
        invert()
      </label>
      <label>
        <input
          type="range"
          name="opacity"
          value="1"
          min="0"
          max="1"
          step="0.1" />
        opacity()
      </label>
      <label>
        <input
          type="range"
          name="saturate"
          value="1"
          min="0"
          max="2"
          step="0.1" />
        saturate()
      </label>
      <label>
        <input type="range" name="sepia" value="0" min="0" max="1" step="0.1" />
        sepia()
      </label>
      <button type="reset">Reset</button>
    </fieldset>
  </form>
</article>

<pre><output></output></pre>

<p>Image by <cite>DigitalNomad</cite></p>
```

```css hidden live-sample___filters
article {
  display: grid;
  grid-template-columns: minmax(200px, 800px) 15em;
  gap: 1rem;
  max-width: 100%;
}
label {
  display: block;
  font-family: sans-serif;
}
input {
  vertical-align: middle;
  margin-right: 0.25em;
  max-width: 50%;
}
output {
  white-space: normal;
  overflow-wrap: break-word;
  display: block;
  width: 100%;
}

img {
  margin: 1rem;
  width: 100%;
  object-fit: cover;
  overflow: hidden;
}
```

```js hidden live-sample___filters
const image = document.querySelector("img");
const controls = document.querySelectorAll("input");
const output = document.querySelector("output");

for (control of controls) {
  control.addEventListener("change", () => {
    /* do function */
    changeCSS();
  });
}
document.querySelector("button").addEventListener("click", () => {
  setTimeout(() => {
    changeCSS();
  }, 50);
});

function changeCSS() {
  let currentFilter = "filter: ";
  for (const filter of [
    blur(),
    brightness(),
    contrast(),
    dropShadow(),
    grayscale(),
    hueRotate(),
    invert(),
    opacity(),
    saturate(),
    sepia(),
  ]) {
    currentFilter += filter;
  }
  currentFilter += ";";
  image.setAttribute("style", currentFilter);
  output.innerText = currentFilter;
}
function blur() {
  let blurValue = document.getElementsByName("blur")[0].value;
  return blurValue === "0" ? "" : `blur(${blurValue}rem) `;
}
function brightness() {
  let brightnessValue = document.getElementsByName("brightness")[0].value;
  return brightnessValue.toString() === "1"
    ? ""
    : `brightness(${brightnessValue}) `;
}
function contrast() {
  let contrastValue = document.getElementsByName("contrast")[0].value;
  return contrastValue === 1 ? "" : `contrast(${contrastValue}) `;
}
function dropShadow() {
  let dropShadowValue = document.getElementsByName("dropShadow")[0].value;
  return dropShadowValue === 0
    ? ""
    : `drop-shadow(${dropShadowValue}rem ${dropShadowValue}rem 0rem orange) `;
}
function grayscale() {
  let grayscaleValue = document.getElementsByName("grayscale")[0].value;
  return grayscaleValue === 0 ? "" : `grayscale(${grayscaleValue}) `;
}
function hueRotate() {
  let hueRotateValue = document.getElementsByName("hueRotate")[0].value;
  return hueRotateValue === 0 ? "" : `hue-rotate(${hueRotateValue}turn) `;
}
function invert() {
  let invertValue = document.getElementsByName("invert")[0].value;
  return invertValue === 0 ? "" : `invert(${invertValue}) `;
}
function opacity() {
  let opacityValue = document.getElementsByName("opacity")[0].value;
  return opacityValue === 1 ? "" : `opacity(${opacityValue}) `;
}
function saturate() {
  let saturateValue = document.getElementsByName("saturate")[0].value;
  return saturateValue === 1 ? "" : `saturate(${saturateValue}) `;
}
function sepia() {
  let sepiaValue = document.getElementsByName("sepia")[0].value;
  return sepiaValue === 0 ? "" : `sepia(${sepiaValue})`;
}
```

{{EmbedLiveSample("filters", "", "550px")}}

### Thuộc tính

- {{cssxref("backdrop-filter")}}
- {{cssxref("filter")}}

### Hàm

- {{cssxref("filter-function/blur", "blur()")}}
- {{cssxref("filter-function/brightness", "brightness()")}}
- {{cssxref("filter-function/contrast", "contrast()")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- {{cssxref("filter-function/grayscale", "grayscale()")}}
- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
- {{cssxref("filter-function/invert", "invert()")}}
- {{cssxref("filter-function/opacity", "opacity()")}}
- {{cssxref("filter-function/saturate", "saturate()")}}
- {{cssxref("filter-function/sepia", "sepia()")}}

## Hướng dẫn

- [Sử dụng CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects/Using)
  - : Tổng quan về các khái niệm xung quanh CSS filter effects, bao gồm các thuộc tính, hàm filter và SVG filters, cùng với giải thích về giá trị filter, thứ tự nguồn và tương tác giá trị.

## Khái niệm liên quan

- Kiểu dữ liệu {{cssxref("image")}}
- Kiểu dữ liệu {{cssxref("filter-function")}}

- Thuộc tính CSS {{cssxref("background-image")}}
- Thuộc tính CSS {{cssxref("background-blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}

- Thuật ngữ {{glossary("interpolation")}}

- Thuộc tính SVG [`color-interpolation-filters`](/en-US/docs/Web/SVG/Reference/Attribute/color-interpolation-filters)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính trong module [CSS compositing and blending](/en-US/docs/Web/CSS/Guides/Compositing_and_blending) cho phép pha trộn các lớp nền của phần tử với nhau và pha trộn phần tử với container chứa nó
- Phần tử SVG {{SVGElement("filter")}} và các filter primitive SVG: {{SVGElement("feSpotLight")}}, {{SVGElement("feBlend")}}, {{SVGElement("feColorMatrix")}}, {{SVGElement("feComponentTransfer")}}, {{SVGElement("feComposite")}}, {{SVGElement("feConvolveMatrix")}}, {{SVGElement("feDiffuseLighting")}}, {{SVGElement("feDisplacementMap")}}, {{SVGElement("feDropShadow")}}, {{SVGElement("feFlood")}}, {{SVGElement("feGaussianBlur")}}, {{SVGElement("feImage")}}, {{SVGElement("feMerge")}}, {{SVGElement("feMorphology")}}, {{SVGElement("feOffset")}}, {{SVGElement("feSpecularLighting")}}, {{SVGElement("feTile")}}, {{SVGElement("feTurbulence")}}
