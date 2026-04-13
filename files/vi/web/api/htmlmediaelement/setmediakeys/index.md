---
title: "HTMLMediaElement: phương thức setMediaKeys()"
short-title: setMediaKeys()
slug: Web/API/HTMLMediaElement/setMediaKeys
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.setMediaKeys
---

{{APIRef("HTML DOM")}}{{SecureContext_Header}}

Phương thức **`setMediaKeys()`** của giao diện {{domxref("HTMLMediaElement")}} đặt {{domxref("MediaKeys")}} sẽ được sử dụng để giải mã phương tiện trong khi phát lại.

Nó trả về {{jsxref("Promise")}} đáp ứng nếu khóa mới được đặt thành công hoặc từ chối nếu không thể đặt khóa.

## Cú pháp

```js-nolint
setMediaKeys(mediaKeys)
```

### Tham số

- `mediaKeys`
- : Một đối tượng {{domxref("MediaKeys")}} mà {{domxref("HTMLMediaElement")}} có thể sử dụng để giải mã dữ liệu đa phương tiện trong khi phát lại.

### Giá trị trả về

{{jsxref("Promise")}} đáp ứng {{jsxref('undefined')}}.

### Ngoại lệ

Lời hứa được trả lại có thể từ chối một lỗi:

- `InvalidStateError` {{domxref("DOMException")}}
- : Các khóa phương tiện đang trong quá trình được gắn hoặc không thể xóa các khóa trước đó tại thời điểm hiện tại (ví dụ: vì việc triển khai cụ thể không cho phép xóa trong khi phát lại).
- {{domxref("QuotaExceededError")}}
- : Các khóa được chuyển đã được sử dụng bởi một phần tử khác hoặc trình duyệt không thể sử dụng nó với phần tử này vì các lý do khác.
- `NotSupportedError` {{domxref("DOMException")}}
- : Không thể tách rời các khóa phương tiện hiện được liên kết với phương tiện vì điều này không được CDM hoặc trình duyệt hỗ trợ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
