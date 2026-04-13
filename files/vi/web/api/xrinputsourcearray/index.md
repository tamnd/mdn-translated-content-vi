---
title: XRInputSourceArray
slug: Web/API/XRInputSourceArray
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRInputSourceArray
---

{{APIRef("WebXR Device API")}}{{SecureContext_header}}{{SeeCompatTable}}

Giao diện **`XRInputSourceArray`** đại diện cho danh sách _trực tiếp_ các nguồn đầu vào WebXR, và được sử dụng làm giá trị trả về của thuộc tính {{domxref("XRSession.inputSources", "inputSources")}} của {{domxref("XRSession")}}. Mỗi mục là một {{domxref("XRInputSource")}} đại diện cho một thiết bị đầu vào được kết nối với hệ thống WebXR.

Ngoài việc có thể truy cập các nguồn đầu vào trong danh sách bằng ký hiệu mảng chuẩn (tức là, với số chỉ mục bên trong dấu ngoặc vuông), các phương thức có sẵn để sử dụng iterator và phương thức {{domxref("XRInputSourceArray.forEach", "forEach()")}} cũng có sẵn.

## Thuộc tính phiên bản

_Các thuộc tính sau có sẵn trên các đối tượng `XRInputSourceArray`._

- {{domxref("XRInputSourceArray.length", "length")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Số lượng đối tượng {{domxref("XRInputSource")}} trong danh sách.

## Phương thức phiên bản

_Các phương thức sau có sẵn trên các đối tượng `XRInputSourceArray`. Bạn cũng có thể sử dụng các tính năng của kiểu [`Symbol`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)._

- {{domxref("XRInputSourceArray.entries", "entries()")}} {{Experimental_Inline}}
  - : Trả về một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) bạn có thể sử dụng để duyệt danh sách các cặp key/value trong danh sách. Mỗi mục trả về là một mảng có giá trị đầu tiên là chỉ mục và giá trị thứ hai là {{domxref("XRInputSource")}} tại chỉ mục đó.
- {{domxref("XRInputSourceArray.forEach", "forEach()")}} {{Experimental_Inline}}
  - : Lặp qua từng mục trong danh sách, theo thứ tự từ đầu đến cuối.
- {{domxref("XRInputSourceArray.keys", "keys()")}} {{Experimental_Inline}}
  - : Danh sách các khóa tương ứng với các mục trong danh sách nguồn đầu vào.
- {{domxref("XRInputSourceArray.values", "values()")}} {{Experimental_Inline}}
  - : Trả về một `iterator` bạn có thể sử dụng để duyệt qua tất cả các giá trị trong danh sách. Mỗi mục là một đối tượng {{domxref("XRInputSource")}} duy nhất.

Ngoài các phương thức này, bạn có thể sử dụng ký hiệu mảng để truy cập các mục trong danh sách theo chỉ mục. Ví dụ, đoạn code dưới đây gọi hàm `handleInput()`, truyền vào mục đầu tiên trong danh sách nguồn đầu vào, nếu danh sách không rỗng.

```js
let sources = xrSession.inputSources;
if (sources.length > 0) {
  handleInput(sources[0]);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
