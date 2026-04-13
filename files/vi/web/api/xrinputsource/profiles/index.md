---
title: "XRInputSource: profiles property"
short-title: profiles
slug: Web/API/XRInputSource/profiles
page-type: web-api-instance-property
browser-compat: api.XRInputSource.profiles
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`profiles`** của {{domxref("XRInputSource")}} trả về một mảng các chuỗi, mỗi chuỗi mô tả một hồ sơ cấu hình cho nguồn đầu vào. Các chuỗi hồ sơ được liệt kê theo thứ tự từ cụ thể nhất đến tổng quát nhất.

> [!NOTE]
> Danh sách `profiles` luôn rỗng khi phiên WebXR đang ở chế độ inline.

## Giá trị

Một mảng các chuỗi, mỗi chuỗi mô tả một hồ sơ cấu hình cho thiết bị đầu vào được đại diện bởi đối tượng `XRInputSource`. Mỗi hồ sơ đầu vào chỉ định cách trình bày trực quan ưa thích và hành vi của nguồn đầu vào.

### Tên hồ sơ đầu vào

Tên hồ sơ đầu vào là chuỗi mô tả cách trình bày trực quan và hành vi mà nguồn đầu vào có thể được cấu hình để sử dụng. Mỗi chuỗi:

- Không có khoảng trắng; thay vào đó, các từ được phân cách bằng dấu gạch ngang ("-")
- Nếu nền tảng cung cấp, ID nhà cung cấp USB và sản phẩm có thể được cung cấp nhưng không thể dựa vào
- Không xác định duy nhất một thiết bị cụ thể; thay vào đó, nó xác định cấu hình mà sản phẩm có thể sử dụng
- Không cung cấp thông tin về tính thuận tay của thiết bị, nếu có

[WebXR Input Profiles Registry](https://github.com/immersive-web/webxr-input-profiles/tree/main/packages/registry) được sử dụng bởi các nhà phát triển thiết bị và nhà phát triển trình duyệt để cố gắng đảm bảo rằng một thiết bị nhất định sẽ báo cáo cùng các chuỗi hồ sơ bất kể trình duyệt hoặc {{Glossary("user agent")}} nào bạn sử dụng.

### Tên hồ sơ đầu vào chung

Các tên hồ sơ đầu vào sau là chung và có thể dùng làm dự phòng mô tả thiết bị ở mức tổng quát nhất.

- generic-button
- generic-hand-select-grasp
- generic-hand-select
- generic-hand
- generic-touchpad
- generic-touchscreen
- generic-trigger-squeeze-thumbstick
- generic-trigger-squeeze-touchpad-thumbstick
- generic-trigger-squeeze-touchpad
- generic-trigger-squeeze
- generic-trigger-thumbstick
- generic-trigger-touchpad-thumbstick
- generic-trigger-touchpad
- generic-trigger

## Ví dụ

Danh sách trong `profiles` theo thứ tự từ cụ thể nhất đến tổng quát nhất; nghĩa là, mô tả chính xác nhất đứng đầu và mô tả ít chính xác nhất đứng cuối. Mục đầu tiên trong danh sách thường chỉ ra mô hình chính xác của bộ điều khiển hoặc một mô hình mà bộ điều khiển tương thích.

Ví dụ, mục 0 trong `profiles` cho bộ điều khiển Oculus Touch là `oculus-touch`. Mục tiếp theo là `generic-trigger-squeeze-thumbstick`, cho biết một thiết bị chung có cò súng, điều khiển bóp và thanh trượt. Mặc dù bộ điều khiển Oculus Touch thực sự có touchpad thay vì thanh trượt, mô tả tổng thể "đủ gần" để các chi tiết trong hồ sơ khớp với tên sẽ cho phép bộ điều khiển được diễn giải một cách hữu ích.

```js
inputSource.profiles;
// ['oculus-touch', 'generic-trigger-squeeze-thumbstick']
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Đầu vào và nguồn đầu vào](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
