---
title: "XRInputSourceArray: length property"
short-title: length
slug: Web/API/XRInputSourceArray/length
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRInputSourceArray.length
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`length`** trả về một giá trị số nguyên cho biết số lượng mục trong danh sách nguồn đầu vào được đại diện bởi đối tượng {{domxref("XRInputSourceArray")}}.

## Giá trị

Một giá trị số nguyên cho biết số lượng đối tượng {{domxref("XRInputSource")}} đại diện cho các nguồn đầu vào WebXR có trong mảng.

## Ví dụ

Trong ví dụ này, một trò chơi yêu cầu ít nhất một nguồn đầu vào sử dụng `length` để kiểm tra điều này trước khi cho phép người dùng chơi trò chơi.

```js
let sources = xrSession.inputSources;

if (sources.length === 0) {
  showAlertDialog(
    "You need to have at least one controller to play Super Duper Shark Jump Fest 9000.",
    [
      { label: "Shop Now", url: "https://www.example.com/shop/controllers" },
      { label: "Quit", handler: quitGame },
    ],
  );
}
```

Ở đây, nếu `length` là 0, một hàm giả thuyết `showAlertDialog()` được gọi với chuỗi nhắc nhở giải thích nhu cầu về controller, và một mảng các đối tượng, mỗi đối tượng mô tả một nút và điều gì sẽ xảy ra khi nó được nhấp. Đầu tiên đưa người dùng đến trang tìm kiếm controller trên Amazon.com, và thứ hai gọi hàm `quitGame()` để bắt đầu tắt chương trình trò chơi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
