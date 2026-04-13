---
title: "Navigator: phương thức vibrate()"
short-title: vibrate()
slug: Web/API/Navigator/vibrate
page-type: web-api-instance-method
browser-compat: api.Navigator.vibrate
---

{{APIRef("Vibration API")}}

Phương thức **`vibrate()`** của giao diện {{domxref("Navigator")}} tạo xung rung
phần cứng trên thiết bị, nếu phần cứng đó tồn tại. Nếu thiết bị không hỗ trợ
rung động, phương pháp này không có tác dụng. Nếu một kiểu rung đang diễn ra khi
phương thức này được gọi, mẫu trước đó sẽ bị tạm dừng và thay vào đó, mẫu mới sẽ bắt đầu.

Nếu phương thức không thể rung do tham số không hợp lệ, nó sẽ trả về
`false`, nếu không nó sẽ trả về `true`. Nếu mô hình dẫn đến một quá
rung lâu, nó bị cắt ngắn: độ dài tối đa phụ thuộc vào việc thực hiện.

Một số thiết bị có thể không rung nếu chúng ở chế độ Im lặng hoặc chế độ Không làm phiền (DND). Để đảm bảo chế độ rung hoạt động, hãy đảm bảo các chế độ này đã tắt và chế độ rung đó được bật trong cài đặt hệ thống.

## Cú pháp

```js-nolint
vibrate(pattern)
```

### Thông số

- `pattern`
  - : Cung cấp kiểu rung và khoảng thời gian tạm dừng. Mỗi giá trị biểu thị một số
    mili giây để rung hoặc tạm dừng luân phiên. Bạn có thể cung cấp một
    giá trị (rung một lần trong nhiều mili giây) hoặc một mảng các giá trị để
    luân phiên rung, tạm dừng, sau đó rung lại. Xem [Vibration API](/en-US/docs/Web/API/Vibration_API) để biết chi tiết.

Truyền giá trị `0`, một mảng trống hoặc một mảng chứa tất cả các số 0
sẽ hủy mọi kiểu rung hiện đang diễn ra.

### Giá trị trả về

Một boolean.

## Bảo vệ

[Sticky user activation](/en-US/docs/Web/Security/Defenses/User_activation) là bắt buộc. Người dùng phải tương tác với trang hoặc thành phần giao diện người dùng để tính năng này hoạt động.

## Ví dụ

```js
navigator.vibrate(200); // vibrate for 200ms
navigator.vibrate([
  100, 30, 100, 30, 100, 30, 200, 30, 200, 30, 200, 30, 100, 30, 100, 30, 100,
]); // Vibrate 'SOS' in Morse.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Vibration API](/en-US/docs/Web/API/Vibration_API)
