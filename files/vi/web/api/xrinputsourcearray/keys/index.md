---
title: "XRInputSourceArray: keys() method"
short-title: keys()
slug: Web/API/XRInputSourceArray/keys
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRInputSourceArray.keys
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`keys()`** trong giao diện {{domxref("XRInputSourceArray")}} trả về một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) {{Glossary("JavaScript")}} có thể được sử dụng để lặp qua các khóa được dùng để tham chiếu từng mục trong mảng nguồn đầu vào.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) JavaScript có thể được dùng để duyệt qua các khóa cho mỗi mục trong danh sách nguồn đầu vào. Các giá trị được trả về bởi iterator là các chỉ mục của mỗi mục trong danh sách, tức là các số 0, 1, 2, v.v. cho đến chỉ mục của mục cuối cùng trong danh sách.

## Ví dụ

Đoạn code này lấy danh sách đầu vào cho một phiên và cố gắng xử lý từng loại thiết bị đầu vào mà nó hỗ trợ.

```js
for (const inputIdx of xrSession.inputSources.keys()) {
  /* the keys are the indexes into the list of inputs */
  checkInput(xrSession.inputSources[inputIdx]);
}
```

Ở đây, [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) được sử dụng để lặp qua từng khóa. Đối với mỗi khóa, đầu vào được lấy bằng chỉ mục với ký hiệu mảng: `xrSession.inputSources[inputIdx]`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Inputs and input sources](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- Phương thức {{domxref("XRInputSourceArray.values", "values()")}} của {{domxref("XRInputSourceArray")}}
- Phương thức `keys()` của [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)
- {{domxref("XRInputSource")}}
