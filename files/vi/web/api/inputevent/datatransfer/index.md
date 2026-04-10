---
title: "InputEvent: thuộc tính dataTransfer"
short-title: dataTransfer
slug: Web/API/InputEvent/dataTransfer
page-type: web-api-instance-property
browser-compat: api.InputEvent.dataTransfer
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`dataTransfer`** của giao diện {{domxref("InputEvent")}} trả về một đối tượng {{domxref("DataTransfer")}} chứa thông tin về dữ liệu văn bản giàu định dạng hoặc văn bản thuần túy đang được thêm vào hoặc xóa khỏi nội dung có thể chỉnh sửa.

## Giá trị

Một đối tượng {{domxref("DataTransfer")}} hoặc `null`. Đặc điểm kỹ thuật có một [tổng quan](https://w3c.github.io/input-events/#overview) về giá trị của nó trong các trường hợp khác nhau.

## Ví dụ

Trong ví dụ đơn giản sau, chúng ta đã thiết lập một trình lắng nghe sự kiện trên sự kiện [input](/en-US/docs/Web/API/Element/input_event) để khi bất kỳ nội dung nào được dán vào phần tử {{htmlelement("p")}} có thuộc tính contenteditable, nguồn HTML của nó được truy xuất thông qua phương thức [`InputEvent.dataTransfer.getData()`](/en-US/docs/Web/API/DataTransfer/getData) và được báo cáo trong đoạn văn bên dưới đầu vào.

Hãy thử sao chép và dán một số nội dung được cung cấp để xem hiệu ứng.

```html
<p><span style="font-weight: bold; color: blue">Whoa, bold blue text!</span></p>
<p>
  <span style="font-style: italic; color: red">Exciting: italic red text!</span>
</p>
<p>Boring normal text ;-(</p>

<hr />

<p contenteditable="true">
  Go on, try pasting some content into this editable paragraph and see what
  happens!
</p>

<p class="result"></p>
```

```js
const editable = document.querySelector("p[contenteditable]");
const result = document.querySelector(".result");

editable.addEventListener("input", (e) => {
  result.textContent = e.dataTransfer.getData("text/html");
});
```

{{EmbedLiveSample('Examples', '100%', 250)}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
