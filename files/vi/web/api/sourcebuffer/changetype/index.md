---
title: "SourceBuffer: phương thức ChangeType()"
short-title: changeType()
slug: Web/API/SourceBuffer/changeType
page-type: web-api-instance-method
browser-compat: api.SourceBuffer.changeType
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`changeType()`** của
Giao diện {{domxref("SourceBuffer")}} đặt loại MIME mà các cuộc gọi trong tương lai sẽ tới
{{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} sẽ mong đợi phương tiện truyền thông mới
dữ liệu để phù hợp. Điều này giúp có thể thay đổi codec hoặc loại vùng chứa
giữa dòng.

Một kịch bản trong đó điều này hữu ích là hỗ trợ việc điều chỉnh nguồn phương tiện phù hợp với
thay đổi tính khả dụng của băng thông, bằng cách chuyển từ codec này sang codec khác dưới dạng tài nguyên
những ràng buộc thay đổi.


## Cú pháp

```js-nolint
changeType(type)
```


### Thông số

- `type`
  - : Một chuỗi chỉ định loại MIME mà bộ đệm trong tương lai sẽ tuân theo

    đến.

### Giá trị trả về


Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu chuỗi được chỉ định trống, thay vì chỉ ra loại MIME hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném nếu {{domxref("SourceBuffer")}} không phải là thành viên của nguồn phương tiện gốc
    {{domxref("MediaSource.sourceBuffers", "sourceBuffers")}} hoặc danh sách của bộ đệm
    Thuộc tính {{domxref("SourceBuffer.updating", "updating")}} chỉ ra rằng trước đó
    xếp hàng {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} hoặc
    {{domxref("SourceBuffer.remove", "remove()")}} vẫn đang được xử lý.
- `NotSupportedError` {{domxref("DOMException")}}

  - : Bị ném nếu loại MIME đã chỉ định không được hỗ trợ hoặc không được hỗ trợ với các loại
    {{domxref("SourceBuffer")}} đối tượng có trong
    {{domxref("MediaSource.sourceBuffers")}} danh sách.

## Ghi chú sử dụng


Nếu thuộc tính {{domxref("MediaSource.readyState", "readyState")}} của cha mẹ {{domxref("MediaSource")}} được đặt thành `"ended"`, hãy gọi `changeType()`
sẽ đặt thuộc tính `readyState` thành `"open"` và

kích hoạt một sự kiện có tên {{domxref("MediaSource.sourceopen_event", "sourceopen")}} tại nguồn phương tiện chính.

## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
