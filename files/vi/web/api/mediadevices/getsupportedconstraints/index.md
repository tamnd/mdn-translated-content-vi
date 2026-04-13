---
title: "MediaDevices: getSupportedConstraints() method"
short-title: getSupportedConstraints()
slug: Web/API/MediaDevices/getSupportedConstraints
page-type: web-api-instance-method
browser-compat: api.MediaDevices.getSupportedConstraints
---

{{APIRef("Media Capture and Streams")}}{{SecureContext_Header}}

Phương thức **`getSupportedConstraints()`** của giao diện {{domxref("MediaDevices")}} trả về một đối tượng dựa trên dictionary {{domxref("MediaTrackSupportedConstraints")}}, trong đó mỗi trường thành viên chỉ định một trong các thuộc tính có thể ràng buộc mà {{Glossary("user agent")}} hiểu được.

## Cú pháp

```js-nolint
getSupportedConstraints()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới dựa trên dictionary {{domxref("MediaTrackSupportedConstraints")}} liệt kê các ràng buộc được user agent hỗ trợ.
Vì chỉ những ràng buộc được user agent hỗ trợ mới được đưa vào danh sách, mỗi thuộc tính Boolean này có giá trị `true`.

## Ví dụ

Ví dụ này xuất ra danh sách các ràng buộc được trình duyệt của bạn hỗ trợ.

```html hidden
<p>Trình duyệt của bạn hỗ trợ các ràng buộc phương tiện sau:</p>

<ul id="constraintList"></ul>
```

```css hidden
body {
  font:
    15px "Arial",
    sans-serif;
}
```

```js
const constraintList = document.querySelector("#constraintList");
const supportedConstraints = navigator.mediaDevices.getSupportedConstraints();

for (const constraint of Object.keys(supportedConstraints)) {
  const elem = document.createElement("li");
  elem.appendChild(document.createElement("code")).textContent = constraint;
  constraintList.appendChild(elem);
}
```

### Kết quả

{{ EmbedLiveSample('Examples', 600, 350) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
