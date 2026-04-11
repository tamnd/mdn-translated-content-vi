---
title: "RTCRtpReceiver: thuộc tính jitterBufferTarget"
short-title: jitterBufferTarget
slug: Web/API/RTCRtpReceiver/jitterBufferTarget
page-type: web-api-instance-property
browser-compat: api.RTCRtpReceiver.jitterBufferTarget
---

{{APIRef("WebRTC API")}}

Thuộc tính **`jitterBufferTarget`** của giao diện {{domxref("RTCRtpReceiver")}} là một {{domxref("DOMHighResTimeStamp")}} cho biết khoảng thời gian ưu tiên, tính bằng mili giây, mà {{glossary("jitter","jitter buffer")}} nên giữ media trước khi phát ra.

Ứng dụng có thể dùng nó để ảnh hưởng đến sự đánh đổi giữa độ trễ phát và nguy cơ hết khung âm thanh hoặc video do jitter mạng.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} cho biết thời gian giữ mục tiêu hiện tại của jitter buffer, tính bằng mili giây.

Giá trị có thể được đặt thành một giá trị dương không lớn hơn 4000 mili giây.

## Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu mục tiêu được đặt thành một giá trị âm hoặc một giá trị lớn hơn 4000 mili giây.

## Mô tả

Giá trị của thuộc tính ảnh hưởng đến lượng đệm do user agent thực hiện, và điều này ảnh hưởng tới retransmission và phục hồi mất gói.

Lưu ý rằng thuộc tính này chỉ "ảnh hưởng" đến mục tiêu jitter buffer của user agent, chứ không trực tiếp đặt nó.
Mục tiêu jitter buffer thực tế của user agent sẽ thay đổi trong khoảng giá trị tối đa và tối thiểu được phép, phản ánh một dải mục tiêu mà user agent có thể cung cấp dựa trên điều kiện mạng và giới hạn bộ nhớ, và có thể thay đổi bất kỳ lúc nào.
Giá trị trả về bởi `jitterBufferTarget` không bị ảnh hưởng bởi mục tiêu thực tế của user agent.

Độ trễ trung bình của jitter buffer có thể được tính bằng cách chia {{domxref("RTCInboundRtpStreamStats.jitterBufferTargetDelay")}} cho {{domxref("RTCInboundRtpStreamStats.jitterBufferEmittedCount")}}.
Để quan sát tác động của việc thay đổi mục tiêu jitter buffer, bạn có thể theo dõi sự thay đổi của giá trị trung bình này theo thời gian.
Bạn cũng có thể so sánh với {{domxref("RTCInboundRtpStreamStats.jitterBufferTargetDelay", "jitterBufferMinimumDelay")}} (hoặc giá trị trung bình của nó) để loại bỏ các yếu tố mạng vốn có ảnh hưởng đến độ trễ.

Nếu các track âm thanh và video của `RTCRtpReceiver` được đồng bộ hóa, thì nên dùng giá trị `jitterBufferTarget` lớn hơn trong hai bộ nhận cho cả hai bộ nhận.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
