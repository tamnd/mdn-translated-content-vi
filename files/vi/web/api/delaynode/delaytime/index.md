---
title: "DelayNode: thuộc tính delayTime"
short-title: delayTime
slug: Web/API/DelayNode/delayTime
page-type: web-api-instance-property
browser-compat: api.DelayNode.delayTime
---

{{ APIRef("Web Audio API") }}

Thuộc tính `delayTime` của giao diện {{ domxref("DelayNode") }} là một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho lượng độ trễ cần áp dụng.

`delayTime` được biểu diễn bằng giây, giá trị tối thiểu là `0` và giá trị tối đa được định nghĩa bởi đối số `maxDelayTime` của phương thức {{domxref("BaseAudioContext.createDelay")}} đã tạo ra nó.

> [!NOTE]
> Mặc dù {{domxref("AudioParam")}} được trả về là chỉ đọc, giá trị mà nó đại diện thì không.

## Giá trị

Một {{domxref("AudioParam")}}.

## Ví dụ

Xem [`BaseAudioContext.createDelay()`](/en-US/docs/Web/API/BaseAudioContext/createDelay#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
