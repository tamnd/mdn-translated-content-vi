---
title: "SourceBuffer: phương thức RemoveAsync()"
short-title: removeAsync()
slug: Web/API/SourceBuffer/removeAsync
page-type: web-api-instance-method
status:
  - experimental
  - non-standard
browser-compat: api.SourceBuffer.removeAsync
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{Non-standard_Header}}{{SeeCompatTable}}

Phương thức **`removeAsync()`** của
Giao diện {{domxref("SourceBuffer")}} bắt đầu quá trình xóa không đồng bộ
từ các phân đoạn phương tiện `SourceBuffer` được tìm thấy trong một thời gian cụ thể
phạm vi. Trả về {{jsxref("Promise")}}, điều này được đáp ứng khi bộ đệm
trong khoảng thời gian quy định đã bị loại bỏ.

Phương thức này chỉ có thể được gọi khi {{domxref("SourceBuffer.updating", "updating")}}
`false`. Nếu không phải như vậy, hãy gọi {{domxref("SourceBuffer.abort", "abort()")}} thay thế.


## Cú pháp

```js-nolint
removeAsync(start, end)
```


### Thông số

- `start`
  - : Một double biểu thị thời điểm bắt đầu của phạm vi thời gian, tính bằng giây.
- `end`

  - : Một double biểu thị sự kết thúc của khoảng thời gian, tính bằng giây.

### Giá trị trả về


Một {{jsxref("Promise")}} có trình xử lý thực hiện được thực thi sau khi bộ đệm trong
phạm vi thời gian được chỉ định đã bị xóa khỏi `SourceBuffer`.

## Ví dụ

Ví dụ này thiết lập hàm không đồng bộ, `emptySourceBuffer()`,
để xóa nội dung của `SourceBuffer` đã chỉ định.

```js
async function emptySourceBuffer(msBuffer) {
  await msBuffer.removeAsync(0, Infinity).catch((e) => {
    handleException(e);

  });
}
```


## Thông số kỹ thuật


Tính năng này không phải là một phần của bất kỳ thông số kỹ thuật nào. Nó không đi đúng hướng để trở thành một tiêu chuẩn.

## Khả năng tương thích của trình duyệt


{{Compat}}

## Xem thêm

- [API tiện ích mở rộng nguồn phương tiện](/en-US/docs/Web/API/Media_Source_Extensions_API)
- {{domxref("SourceBuffer.remove()")}}
- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
