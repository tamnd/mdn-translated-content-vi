---
title: "SourceBuffer: thuộc tính timestampOffset"
short-title: timestampOffset
slug: Web/API/SourceBuffer/timestampOffset
page-type: web-api-instance-property
browser-compat: api.SourceBuffer.timestampOffset
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`timestampOffset`** của
Giao diện {{domxref("SourceBuffer")}} kiểm soát phần bù được áp dụng cho dấu thời gian bên trong
các phân đoạn phương tiện được thêm vào `SourceBuffer`.

Giá trị ban đầu của `timestampOffset` là 0.


## Giá trị

Gấp đôi, với số tiền bù được biểu thị bằng giây.


### Ngoại lệ

Ngoại lệ sau có thể được đưa ra khi đặt giá trị mới cho thuộc tính này:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném nếu một hoặc nhiều đối tượng {{domxref("SourceBuffer")}} trong
    {{domxref("MediaSource.sourceBuffers")}} đang được cập nhật
    (tức là thuộc tính {{domxref("SourceBuffer.updating")}} của họ là
    hiện tại `true`), một phân đoạn phương tiện truyền thông bên trong
    `SourceBuffer` hiện đang được phân tích cú pháp hoặc điều này
    `SourceBuffer` đã bị xóa khỏi

    {{domxref("MediaSource")}}.

## Ví dụ


TBD


## Thông số kỹ thuật

{{Specifications}}


## Khả năng tương thích của trình
 duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
