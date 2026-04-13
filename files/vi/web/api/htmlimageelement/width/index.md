---
title: "HTMLImageElement: width property"
short-title: width
slug: Web/API/HTMLImageElement/width
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.width
---

{{APIRef("HTML DOM")}}

Thuộc tính **`width`** của giao diện {{domxref("HTMLImageElement")}} cho biết chiều rộng mà hình ảnh được vẽ, trong {{Glossary("CSS pixel", "CSS pixels")}}, nếu hình ảnh đang được vẽ hoặc hiển thị trên bất kỳ phương tiện trực quan nào như màn hình hoặc máy in. Mặt khác, đó là chiều rộng tự nhiên, được điều chỉnh theo mật độ pixel của hình ảnh.

## Giá trị

Một giá trị số nguyên biểu thị chiều rộng của hình ảnh. Cách xác định chiều rộng tùy thuộc vào việc hình ảnh có được hiển thị trên phương tiện trực quan hay không.

- Nếu hình ảnh đang được hiển thị trên phương tiện trực quan như màn hình hoặc máy in thì chiều rộng được biểu thị bằng {{Glossary("CSS pixel", "CSS pixels")}}.
- Mặt khác, chiều rộng của hình ảnh được thể hiện bằng chiều rộng tự nhiên (nội tại) của nó, được điều chỉnh theo mật độ hiển thị như được chỉ ra bởi {{domxref("HTMLImageElement.naturalWidth", "naturalWidth")}}.

## Ví dụ

Trong ví dụ này, hai kích thước khác nhau được cung cấp cho hình ảnh đồng hồ bằng thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset). Một cái rộng 200px và cái kia rộng 400px. Hơn nữa, thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) được cung cấp để chỉ định chiều rộng mà hình ảnh sẽ được vẽ dựa trên chiều rộng của khung nhìn.

### HTML

Đối với các khung nhìn có chiều rộng tối đa 400px, hình ảnh được vẽ ở chiều rộng 200px. Nếu không, nó sẽ được vẽ ở độ phân giải 400px.

```html
<p>Image width: <span class="size">?</span>px (resize to update)</p>
<img
  src="/en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-200px.png"
  alt="Clock"
  srcset="
    /en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-200px.png 200w,
    /en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-400px.png 400w
  "
  sizes="(width <= 400px) 200px, 400px" />
```

### JavaScript

Mã JavaScript xem xét `height` để xác định chiều cao của hình ảnh dựa trên chiều rộng hiện tại của hình ảnh.

```js
const clockImage = document.querySelector("img");
let output = document.querySelector(".size");

const updateWidth = () => {
  output.innerText = clockImage.width;
};

updateWidth();
window.addEventListener("resize", updateWidth);
```

### Kết quả

{{EmbedLiveSample("Examples", 640, 450)}}

Ví dụ này có thể dễ dàng thử hơn {{LiveSampleLink('Examples', 'in its own window')}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.height")}}
- {{domxref("HTMLImageElement.naturalWidth")}}
- {{domxref("HTMLCanvasElement.width")}}
- {{domxref("HTMLEmbedElement.width")}}
- {{domxref("HTMLIFrameElement.width")}}
- {{domxref("HTMLObjectElement.width")}}
- {{domxref("HTMLSourceElement.width")}}
- {{domxref("HTMLVideoElement.width")}}
