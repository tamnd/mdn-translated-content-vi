---
title: "Ink: phương thức requestPresenter()"
short-title: requestPresenter()
slug: Web/API/Ink/requestPresenter
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Ink.requestPresenter
---

{{APIRef("Ink API")}}{{SeeCompatTable}}

Phương thức **`requestPresenter()`** của giao diện {{domxref("Ink")}} trả về một {{jsxref("Promise")}} thực hiện với một đối tượng {{domxref("DelegatedInkTrailPresenter")}} để xử lý việc hiển thị các nét.

## Cú pháp

```js-nolint
requestPresenter(param)
```

### Tham số

- `param` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `presentationArea` {{optional_inline}}
      - : Một {{domxref("Element")}} bên trong phạm vi hiển thị các nét mực được giới hạn (cụ thể là hộp viền của phần tử). Nếu `param` không được bao gồm, hoặc `presentationArea` được đặt thành `null`, việc hiển thị mực mặc định bị giới hạn trong viewport chứa.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một phiên bản đối tượng {{domxref("DelegatedInkTrailPresenter")}}.

### Ngoại lệ

- `Error` {{domxref("DOMException")}}
  - : Lỗi được ném ra và thao tác bị hủy nếu `presentationArea` không phải là {{domxref("Element")}} hợp lệ, hoặc không nằm trong cùng tài liệu với đối tượng {{domxref("Ink")}} liên quan.

## Ví dụ

```js
async function inkInit() {
  const ink = navigator.ink;
  let presenter = await ink.requestPresenter({ presentationArea: canvas });

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
