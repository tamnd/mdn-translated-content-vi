---
title: "SourceBuffer: thuộc tínhappendWindowEnd"
short-title: appendWindowEnd
slug: Web/API/SourceBuffer/appendWindowEnd
page-type: web-api-instance-property
browser-compat: api.SourceBuffer.appendWindowEnd
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`appendWindowEnd`** của
Giao diện {{domxref("SourceBuffer")}} kiểm soát dấu thời gian khi kết thúc [nối thêm cửa sổ](https://w3c.github.io/media-source/#append-window), a
phạm vi dấu thời gian có thể được sử dụng để lọc dữ liệu phương tiện nào được thêm vào
`SourceBuffer`. Các khung phương tiện được mã hóa có dấu thời gian trong phạm vi này sẽ được
được thêm vào, trong khi những phần nằm ngoài phạm vi sẽ bị lọc ra.

Giá trị mặc định của `appendWindowEnd` là dương vô cực.


## Giá trị

Giá trị gấp đôi, biểu thị thời gian kết thúc của cửa sổ nối thêm, tính bằng giây.


### Ngoại lệ

Các ngoại lệ sau có thể được đưa ra khi đặt giá trị mới cho thuộc tính này:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Bị ném nếu cố gắng đặt giá trị nhỏ hơn hoặc bằng
    {{domxref("SourceBuffer.appendWindowStart")}} hoặc `NaN`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném nếu đối tượng {{domxref("SourceBuffer")}} này đang được cập nhật (tức là
    thuộc tính {{domxref("SourceBuffer.updating")}} của nó là
    hiện tại `true`) hoặc `SourceBuffer` này đã được

    đã bị xóa khỏi {{domxref("MediaSource")}}.

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
