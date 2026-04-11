---
title: "SourceBuffer: thuộc tính chế độ"
short-title: mode
slug: Web/API/SourceBuffer/mode
page-type: web-api-instance-property
browser-compat: api.SourceBuffer.mode
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`mode`** của {{domxref("SourceBuffer")}}
giao diện kiểm soát xem các phân đoạn phương tiện có thể được thêm vào
`SourceBuffer` theo thứ tự bất kỳ hoặc theo trình tự nghiêm ngặt.

Hai giá trị có sẵn là:

- `segments`: Dấu thời gian của phân đoạn phương tiện xác định thứ tự trong đó
  phân đoạn được chơi. Các phân đoạn có thể được thêm vào `SourceBuffer` trong
  bất kỳ thứ tự nào.
- `sequence`: Thứ tự các đoạn được thêm vào
  `SourceBuffer` xác định thứ tự chúng được phát. Phân đoạn
  dấu thời gian được tạo tự động cho các phân đoạn tuân theo thứ tự này.

Giá trị chế độ được đặt ban đầu khi `SourceBuffer` được tạo bằng cách sử dụng
`MediaSource.addSourceBuffer()`. Nếu dấu thời gian đã tồn tại cho phương tiện truyền thông
các phân đoạn thì giá trị sẽ được đặt thành `segments`; nếu họ không làm vậy thì
giá trị sẽ được đặt thành `sequence`.

Nếu bạn cố gắng đặt giá trị thuộc tính `mode` thành `segments` khi
giá trị ban đầu là `sequence`, một ngoại lệ sẽ được đưa ra. Hiện có
Thứ tự phân đoạn phải được duy trì ở chế độ `sequence`. Tuy nhiên, bạn có thể thay đổi
giá trị từ `segments` đến `sequence`. Nó chỉ có nghĩa là vở kịch
thứ tự sẽ được sửa và các dấu thời gian mới được tạo để phản ánh điều này.

Thuộc tính này không thể thay đổi trong khi `SourceBuffer`
đang xử lý {{domxref("SourceBuffer.appendBuffer","appendBuffer()")}} hoặc
{{domxref("SourceBuffer.remove","remove()")}} cuộc gọi.


## Giá trị

Một sợi dây.


### Ngoại lệ

Các ngoại lệ sau có thể được đưa ra khi đặt giá trị mới cho thuộc tính này:

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Bị loại bỏ nếu cố gắng đặt giá trị thành `segments` khi
    giá trị ban đầu là `sequence`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu đối tượng {{domxref("SourceBuffer")}} đang được cập nhật (tức là
    thuộc tính {{domxref("SourceBuffer.updating")}} của nó là
    hiện tại `true`), phân đoạn phương tiện truyền thông cuối cùng được thêm vào này
    `SourceBuffer` chưa đầy đủ hoặc điều này
    `SourceBuffer` đã bị xóa khỏi

    {{domxref("MediaSource")}}.

## Ví dụ

Đoạn mã này đặt chế độ `sourceBuffer` thành `'sequence'` nếu nó
hiện được đặt thành `'segments'`, do đó đặt thứ tự phát theo trình tự
trong đó các phân đoạn phương tiện được thêm vào.

```js
const curMode = sourceBuffer.mode;
if (curMode === "segments") {
  sourceBuffer.mode = "sequence";

}
```


## Thông số kỹ thuật

{{Specifications}}


## Khả năng tương thích của trình
 duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
