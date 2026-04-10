---
title: "PushSubscription: options property"
short-title: options
slug: Web/API/PushSubscription/options
page-type: web-api-instance-property
browser-compat: api.PushSubscription.options
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

**`options`** là thuộc tính chỉ đọc của giao diện {{domxref("PushSubscription")}} và là một đối tượng chứa các tùy chọn đã dùng để tạo đăng ký.

## Giá trị

Một đối tượng {{domxref("PushSubscriptionOptions")}} chỉ đọc chứa các giá trị sau:

- `userVisibleOnly`
  - : Một giá trị boolean, cho biết rằng đăng ký đẩy được trả về sẽ chỉ được dùng cho các thông điệp mà hiệu ứng của chúng được hiển thị cho người dùng.
- `applicationServerKey`
  - : Một khóa công khai mà máy chủ đẩy của bạn sẽ dùng để gửi thông điệp đến ứng dụng máy khách thông qua máy chủ đẩy. Giá trị này là một phần của cặp khóa ký do máy chủ ứng dụng của bạn tạo ra, và có thể dùng với chữ ký số đường cong elliptic (ECDSA), trên đường cong P-256.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
