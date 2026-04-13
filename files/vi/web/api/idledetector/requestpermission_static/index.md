---
title: "IdleDetector: requestPermission() static method"
short-title: requestPermission()
slug: Web/API/IdleDetector/requestPermission_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.IdleDetector.requestPermission_static
---

{{securecontext_header}}{{APIRef("Idle Detection API")}}{{SeeCompatTable}}

Phương thức tĩnh **`requestPermission()`** của giao diện {{domxref("IdleDetector")}} trả về một {{jsxref('Promise')}} phân giải thành một chuỗi khi người dùng đã chọn có cấp quyền truy cập trạng thái rảnh rỗi cho nguồn gốc hay không. Phân giải thành `"granted"` nếu chấp nhận và `"denied"` nếu từ chối.

## Cú pháp

```js-nolint
IdleDetector.requestPermission()
```

### Tham số

Không có.

### Giá trị trả về

Một `Promise` phân giải thành `"granted"` hoặc `"denied"`.

## Bảo mật

Yêu cầu [kích hoạt tạm thời của người dùng](/en-US/docs/Web/Security/Defenses/User_activation). Người dùng phải tương tác với trang hoặc phần tử giao diện để tính năng này hoạt động.

## Ví dụ

Ví dụ dưới đây sử dụng sự kiện `click` trên nút để kích hoạt yêu cầu quyền phát hiện trạng thái rảnh rỗi của người dùng.

```js
startButton.addEventListener("click", async () => {
  if ((await IdleDetector.requestPermission()) !== "granted") {
    console.error("Idle detection permission denied.");
    return;
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
