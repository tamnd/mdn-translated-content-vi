---
title: "HTMLImageElement: currentSrc property"
short-title: currentSrc
slug: Web/API/HTMLImageElement/currentSrc
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.currentSrc
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`currentSrc`** của giao diện {{domxref("HTMLImageElement")}} cho biết URL của hình ảnh được trình duyệt chọn để tải.

## Giá trị

Một chuỗi cho biết URL đầy đủ của hình ảnh hiện được trình duyệt chọn để tải. Nếu hình ảnh sử dụng thuộc tính {{domxref("HTMLImageElement.srcset", "srcset")}}, `currentSrc` cho phép bạn xác định hình ảnh nào trong bộ hình ảnh được cung cấp đã được trình duyệt chọn. Giá trị của thuộc tính không liên quan đến việc hình ảnh đã được tải thành công hay chưa.

## Ví dụ

### Kiểm tra hình ảnh nào được tải

Trong ví dụ này, hai kích thước khác nhau được cung cấp cho hình ảnh của một chiếc đồng hồ. Một cái rộng 200px và cái kia rộng 400px. Thuộc tính [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes) được cung cấp để chỉ ra rằng hình ảnh phải được vẽ ở mức 50% chiều rộng tài liệu nếu khung nhìn rộng dưới 400px; nếu không, hình ảnh sẽ được vẽ ở độ rộng 90% của tài liệu.

#### HTML

```html
<img
  src="/en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-400px.png"
  alt="Clock"
  srcset="
    /en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-200px.png 200w,
    /en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-400px.png 400w
  "
  sizes="(width <= 400px) 50%, 90%" />
```

#### JavaScript

```js
const clockImage = document.querySelector("img");
const p = document.createElement("p");

p.textContent = clockImage.currentSrc.endsWith("200px.png")
  ? "Using the 200px image!"
  : "Using the 400px image.";
document.body.appendChild(p);
```

#### Kết quả

{{EmbedLiveSample("Testing which image is loaded", 640, 370)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.src")}}
- {{domxref("HTMLImageElement.srcSet")}}
