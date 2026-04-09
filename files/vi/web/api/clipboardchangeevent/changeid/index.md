---
title: "ClipboardChangeEvent: thuộc tính changeId"
short-title: changeId
slug: Web/API/ClipboardChangeEvent/changeId
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ClipboardChangeEvent.changeId
---

{{securecontext_header}}{{APIRef("Clipboard API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`changeId`** của giao diện {{domxref("ClipboardChangeEvent")}} trả về một số nguyên biểu diễn mã định danh duy nhất cho thao tác thay đổi bảng nhớ tạm cụ thể này.

Mã định danh này nhất quán trên mọi cửa sổ và tab có cùng khóa lưu trữ đối với cùng một thay đổi của bảng nhớ tạm, cho phép ứng dụng loại bỏ trùng lặp sự kiện khi nhiều cửa sổ nhận cùng một thông báo thay đổi bảng nhớ tạm.

## Giá trị

Một số nguyên. Đây là số nguyên 128 bit được suy ra bằng phương pháp mật mã, bảo đảm rằng sau khi có thứ gì đó được ghi vào bảng nhớ tạm, giá trị thu được sẽ khác với giá trị trước thao tác ghi.

## Ví dụ

Trong ví dụ này, khi nội dung bảng nhớ tạm thay đổi, trình lắng nghe sự kiện sử dụng thuộc tính `ClipboardChangeEvent.changeId` để ghi vào bảng điều khiển ID duy nhất biểu diễn thao tác thay đổi bảng nhớ tạm đã kích hoạt sự kiện.

```js
navigator.clipboard.addEventListener("clipboardchange", (event) => {
  console.log(event.changeId);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ClipboardChangeEvent.types")}}
- {{domxref("ClipboardChangeEvent")}}
- {{domxref("ClipboardEvent")}}
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
