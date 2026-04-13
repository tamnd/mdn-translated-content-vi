---
title: "SourceBuffer: phương thức hủy bỏ()"
short-title: abort()
slug: Web/API/SourceBuffer/abort
page-type: web-api-instance-method
browser-compat: api.SourceBuffer.abort
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`abort()`** của {{domxref("SourceBuffer")}}
giao diện hủy bỏ phân đoạn hiện tại và đặt lại trình phân tích cú pháp phân đoạn.


## Cú pháp

```js-nolint
abort()
```


### Thông số


Không.

### Giá trị trả về


Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném nếu thuộc tính {{domxref("MediaSource.readyState")}} của

    nguồn phương tiện gốc không bằng `open` hoặc điều này
    `SourceBuffer` đã bị xóa khỏi
    {{domxref("MediaSource")}}.

## Ví dụ

Mô tả thông số kỹ thuật của `abort()` hơi khó hiểu — hãy xem xét
ví dụ bước 1 của [đặt lại trạng thái trình phân tích cú pháp](https://w3c.github.io/media-source/index.html#sourcebuffer-reset-parser-state). API MSE hoàn toàn không đồng bộ, nhưng bước này dường như gợi ý một
hoạt động đồng bộ (chặn), điều này không có ý nghĩa gì.

Nói như vậy, việc triển khai hiện tại có thể hữu ích trong một số trường hợp nhất định, khi bạn muốn
để dừng hoạt động nối thêm (hoặc bất cứ điều gì) hiện tại xảy ra trên bộ đệm nguồn, sau đó
ngay lập tức bắt đầu thực hiện lại các thao tác trên nó. Ví dụ: hãy xem xét mã này:

```js
sourceBuffer.addEventListener("updateend", (ev) => {
  // …
});

sourceBuffer.appendBuffer(buf);
```

Giả sử rằng sau lệnh gọi tới `appendBuffer` NHƯNG trước
Sự kiện `updateend` kích hoạt (nghĩa là bộ đệm đang được thêm vào nhưng thao tác

chưa hoàn thành) người dùng "chà" video để tìm kiếm một thời điểm mới. trong
trường hợp này bạn sẽ muốn gọi thủ công `abort()` trên bộ đệm nguồn để
dừng giải mã bộ đệm hiện tại, sau đó tìm nạp và nối thêm bộ đệm mới được yêu cầu

phân đoạn liên quan đến vị trí mới hiện tại của video.

## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
