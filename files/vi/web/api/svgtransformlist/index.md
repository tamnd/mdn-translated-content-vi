---
title: SVGTransformList
slug: Web/API/SVGTransformList
page-type: web-api-interface
browser-compat: api.SVGTransformList
---

{{APIRef("SVG")}}

Giao diện **`SVGTransformList`** định nghĩa một danh sách các đối tượng {{ domxref("SVGTransform") }}.

Một đối tượng `SVGTransformList` có thể được chỉ định là chỉ đọc, nghĩa là các nỗ lực sửa đổi đối tượng sẽ dẫn đến việc ném ra một ngoại lệ.

`SVGTransformList` có thể được đánh chỉ số và truy cập như một mảng.

## Thuộc tính phiên bản

- {{domxref("SVGTransformList.numberOfItems", "numberOfItems")}}
  - : Số lượng phần tử trong danh sách.
- {{domxref("SVGTransformList.length", "length")}}
  - : Số lượng phần tử trong danh sách.

## Phương thức phiên bản

- {{domxref("SVGTransformList.clear", "clear()")}}
  - : Xóa tất cả các phần tử hiện tại khỏi danh sách, kết quả là một danh sách rỗng.
- {{domxref("SVGTransformList.initialize", "initialize()")}}
  - : Xóa tất cả các phần tử hiện tại khỏi danh sách và khởi tạo lại danh sách để giữ phần tử duy nhất được chỉ định bởi tham số. Nếu phần tử được chèn đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó chứ không phải bản sao. Giá trị trả về là phần tử được chèn vào danh sách.
- {{domxref("SVGTransformList.getItem", "getItem()")}}
  - : Trả về phần tử được chỉ định từ danh sách. Phần tử trả về là chính phần tử đó chứ không phải bản sao. Bất kỳ thay đổi nào được thực hiện với phần tử sẽ được phản ánh ngay lập tức trong danh sách. Phần tử đầu tiên có số `0`.
- {{domxref("SVGTransformList.insertItemBefore", "insertItemBefore()")}}
  - : Chèn một phần tử mới vào danh sách tại vị trí chỉ định. Phần tử đầu tiên có số `0`. Nếu `newItem` đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó chứ không phải bản sao. Nếu phần tử đã có trong danh sách này, lưu ý rằng chỉ số của phần tử cần chèn trước là trước khi xóa phần tử. Nếu `index` bằng 0, phần tử mới được chèn vào đầu danh sách. Nếu chỉ số lớn hơn hoặc bằng `numberOfItems`, phần tử mới sẽ được thêm vào cuối danh sách.
- {{domxref("SVGTransformList.replaceItem", "replaceItem()")}}
  - : Thay thế một phần tử hiện có trong danh sách bằng một phần tử mới. Nếu `newItem` đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó chứ không phải bản sao. Nếu phần tử đã có trong danh sách này, lưu ý rằng chỉ số của phần tử cần thay thế là trước khi xóa phần tử.
- {{domxref("SVGTransformList.removeItem", "removeItem()")}}
  - : Xóa một phần tử hiện có khỏi danh sách.
- {{domxref("SVGTransformList.appendItem", "appendItem()")}}
  - : Chèn một phần tử mới vào cuối danh sách. Nếu `newItem` đã có trong một danh sách, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó chứ không phải bản sao.
- {{domxref("SVGTransformList.createSVGTransformFromMatrix", "createSVGTransformFromMatrix()")}}
  - : Tạo một đối tượng `SVGTransform` được khởi tạo với biến đổi kiểu `SVG_TRANSFORM_MATRIX` và có các giá trị là ma trận đã cho. Các giá trị từ tham số ma trận được sao chép, tham số ma trận không được áp dụng trực tiếp làm `SVGTransform::matrix`.
- {{domxref("SVGTransformList.consolidate", "consolidate()")}}
  - : Hợp nhất danh sách các đối tượng `SVGTransform` riêng biệt bằng cách nhân các ma trận biến đổi tương đương lại với nhau, kết quả là một danh sách gồm một đối tượng `SVGTransform` duy nhất kiểu `SVG_TRANSFORM_MATRIX`. Thao tác hợp nhất tạo ra một đối tượng `SVGTransform` mới là phần tử đầu tiên và duy nhất trong danh sách. Phần tử trả về là chính phần tử đó chứ không phải bản sao. Bất kỳ thay đổi nào được thực hiện với phần tử sẽ được phản ánh ngay lập tức trong danh sách.

## Ví dụ

### Sử dụng nhiều đối tượng SVGTransform

Trong ví dụ này, chúng ta tạo một hàm áp dụng ba biến đổi khác nhau cho phần tử SVG đã được nhấp. Để làm điều này, chúng ta tạo một đối tượng {{domxref("SVGTransform")}} riêng biệt cho mỗi biến đổi, chẳng hạn như `translate`, `rotate` và `scale`. Chúng ta áp dụng nhiều biến đổi bằng cách thêm đối tượng biến đổi vào `SVGTransformList` liên kết với một phần tử SVG.

```html
<svg
  id="my-svg"
  viewBox="0 0 300 280"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1">
  <desc>
    Example showing how to transform svg elements that using SVGTransform
    objects
  </desc>
  <polygon
    fill="orange"
    stroke="black"
    stroke-width="5"
    points="100,225 100,115 130,115 70,15 70,15 10,115 40,115 40,225" />
  <rect
    x="200"
    y="100"
    width="100"
    height="100"
    fill="yellow"
    stroke="black"
    stroke-width="5" />
  <text x="40" y="250" font-family="Verdana" font-size="16" fill="green">
    Click on a shape to transform it
  </text>
</svg>
```

```js
function transformMe(evt) {
  // svg root element to access the createSVGTransform() function
  const svgRoot = evt.target.parentNode;
  // SVGTransformList of the element that has been clicked on
  const tfmList = evt.target.transform.baseVal;

  // Create a separate transform object for each transform
  const translate = svgRoot.createSVGTransform();
  translate.setTranslate(50, 5);
  const rotate = svgRoot.createSVGTransform();
  rotate.setRotate(10, 0, 0);
  const scale = svgRoot.createSVGTransform();
  scale.setScale(0.8, 0.8);

  // apply the transformations by appending the SVGTransform objects to the SVGTransformList associated with the element
  tfmList.appendItem(translate);
  tfmList.appendItem(rotate);
  tfmList.appendItem(scale);
}

document.querySelector("polygon").addEventListener("click", transformMe);
document.querySelector("rect").addEventListener("click", transformMe);
```

{{EmbedLiveSample("Using_multiple_SVGTransform_objects",300,280)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
