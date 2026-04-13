---
title: "XRInputSourceArray: values() method"
short-title: values()
slug: Web/API/XRInputSourceArray/values
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRInputSourceArray.values
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`values()`** của {{domxref("XRInputSourceArray")}} trả về một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) {{Glossary("JavaScript")}} có thể duyệt qua danh sách các đối tượng {{domxref("XRInputSource")}} có trong mảng, từ đầu đến cuối.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) JavaScript có thể được sử dụng để duyệt qua danh sách các đối tượng {{domxref("XRInputSource")}} trong mảng, bắt đầu từ mục đầu tiên (tại chỉ mục 0) và tiến thẳng qua danh sách.

## Ví dụ

Đoạn code này duyệt qua từng đầu vào và gọi hàm `checkInput()` với mỗi giá trị được trả về.

```js
for (const source of xrSession.inputSources.values()) {
  checkInput(source);
}
```

Ở đây, [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) được sử dụng để lặp qua nội dung của mảng. Trong mỗi lần qua vòng lặp, `source` là {{domxref("XRInputSource")}} tiếp theo trong danh sách. Vòng lặp kết thúc sau khi mọi đầu vào đã được gửi đến `checkInput()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Inputs and input sources](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- Phương thức {{domxref("XRInputSourceArray.keys", "keys()")}} của {{domxref("XRInputSourceArray")}}
- Phương thức `values()` của [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)
- {{domxref("XRInputSource")}}
