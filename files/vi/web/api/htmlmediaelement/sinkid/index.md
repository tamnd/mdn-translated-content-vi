---
title: "HTMLMediaElement: thuộc tính sinkId"
short-title: sinkId
slug: Web/API/HTMLMediaElement/sinkId
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.sinkId
---

{{APIRef("Audio Output Devices API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`sinkId`** của giao diện {{domxref("HTMLMediaElement")}} trả về một chuỗi là ID duy nhất của thiết bị được sử dụng để phát đầu ra âm thanh.

ID này phải là một trong các giá trị {{domxref("MediaDeviceInfo.deviceId")}} được trả về từ {{domxref("MediaDevices.enumerateDevices()")}}.
Nếu thiết bị mặc định của tác nhân người dùng đang được sử dụng, nó sẽ trả về một chuỗi trống.

## Giá trị

Một chuỗi cho biết thiết bị đầu ra âm thanh hiện tại hoặc chuỗi trống nếu thiết bị đầu ra tác nhân người dùng mặc định đang được sử dụng.

## Yêu cầu bảo mật

Quyền truy cập vào thuộc tính phải tuân theo các ràng buộc sau:

- Thuộc tính phải được gọi bằng [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Audio Output Devices API](/en-US/docs/Web/API/Audio_Output_Devices_API)
- {{domxref("MediaDevices.selectAudioOutput()")}}
- {{domxref("HTMLMediaElement.setSinkId()")}}
