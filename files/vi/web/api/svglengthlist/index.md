---
title: SVGLengthList
slug: Web/API/SVGLengthList
page-type: web-api-interface
browser-compat: api.SVGLengthList
---

{{APIRef("SVG")}}

Giao diện **`SVGLengthList`** định nghĩa một danh sách các đối tượng {{ domxref("SVGLength") }}. Nó được sử dụng cho các thuộc tính {{domxref("SVGAnimatedLengthList.baseVal", "baseVal")}} và {{domxref("SVGAnimatedLengthList.animVal", "animVal")}} của {{domxref("SVGAnimatedLengthList")}}.

Một đối tượng `SVGLengthList` có thể được chỉ định là chỉ đọc, nghĩa là các nỗ lực sửa đổi đối tượng sẽ dẫn đến việc ném ra một ngoại lệ.

Một đối tượng `SVGLengthList` có thể được đánh chỉ mục và truy cập như một mảng.

## Thuộc tính phiên bản

- {{domxref("SVGLengthList.length", "length")}}
  - : Số lượng phần tử trong danh sách.
- {{domxref("SVGLengthList.numberOfItems", "numberOfItems")}}
  - : Số lượng phần tử trong danh sách.

## Phương thức phiên bản

- {{domxref("SVGLengthList.appendItem", "appendItem()")}}
  - : Chèn một phần tử mới vào cuối danh sách.
- {{domxref("SVGLengthList.clear", "clear()")}}
  - : Xóa tất cả các phần tử hiện có khỏi danh sách, kết quả là một danh sách rỗng.
- {{domxref("SVGLengthList.initialize", "initialize()")}}
  - : Xóa tất cả các phần tử hiện có khỏi danh sách và khởi tạo lại danh sách để chứa phần tử duy nhất được chỉ định bởi tham số.
- {{domxref("SVGLengthList.getItem", "getItem()")}}
  - : Trả về phần tử được chỉ định từ danh sách.
- {{domxref("SVGLengthList.insertItemBefore", "insertItemBefore()")}}
  - : Chèn một phần tử mới vào danh sách tại vị trí được chỉ định.
- {{domxref("SVGLengthList.removeItem", "removeItem()")}}
  - : Xóa một phần tử hiện có khỏi danh sách.
- {{domxref("SVGLengthList.replaceItem", "replaceItem()")}}
  - : Thay thế một phần tử hiện có trong danh sách bằng một phần tử mới.

## Ví dụ

### Sử dụng SVGLengthList

Đối tượng `SVGLengthList` có thể được lấy từ đối tượng {{domxref("SVGAnimatedLengthList")}}, bản thân nó có thể được lấy từ nhiều thuộc tính độ dài có thể hoạt hình, chẳng hạn như {{domxref("SVGTextPositioningElement.x")}}.

#### HTML

```html
<svg
  viewBox="0 0 200 100"
  xmlns="http://www.w3.org/2000/svg"
  width="200"
  height="100">
  <text id="text1" x="10" y="50">Hello</text>
</svg>
<button id="equally-distribute">Equally distribute letters</button>
<button id="reset-spacing">Reset spacing</button>
<div>
  <b>Current <code>SVGLengthList</code></b>
  <pre><output id="output"></output></pre>
</div>
```

#### JavaScript

```js
const text = document.getElementById("text1");
const output = document.getElementById("output");
const list = text.x.baseVal;
function equallyDistribute() {
  list.clear();
  for (let i = 0; i < text.textContent.length; i++) {
    const length = text.ownerSVGElement.createSVGLength();
    length.value = i * 20 + 10;
    list.appendItem(length);
  }
  printList();
}
function resetSpacing() {
  const length = text.ownerSVGElement.createSVGLength();
  length.value = 10;
  list.initialize(length);
  printList();
}
function printList() {
  output.textContent = "";
  for (let i = 0; i < list.length; i++) {
    output.innerText += `${list.getItem(i).value}\n`;
  }
}
printList();

document
  .getElementById("equally-distribute")
  .addEventListener("click", equallyDistribute);
document
  .getElementById("reset-spacing")
  .addEventListener("click", resetSpacing);
```

#### Kết quả

{{EmbedLiveSample("Using SVGLengthList", "", "300")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGNumberList")}}
- {{domxref("SVGPointList")}}
- {{domxref("SVGStringList")}}
- {{domxref("SVGTransformList")}}
