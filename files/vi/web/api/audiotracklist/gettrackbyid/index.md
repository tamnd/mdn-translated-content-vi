---
title: "AudioTrackList: phương thức getTrackById()"
short-title: getTrackById()
slug: Web/API/AudioTrackList/getTrackById
page-type: web-api-instance-method
browser-compat: api.AudioTrackList.getTrackById
---

{{APIRef("HTML DOM")}}

Phương thức **`getTrackById()`** của **{{domxref("AudioTrackList")}}** trả về đối tượng {{domxref("AudioTrack")}} đầu tiên từ danh sách rãnh có {{domxref("AudioTrack.id", "id")}} khớp với chuỗi được chỉ định.
Điều này cho phép bạn tìm một rãnh cụ thể nếu bạn biết chuỗi ID của nó.

## Cú pháp

```js-nolint
getTrackById(id)
```

### Tham số

- `id`
  - : Một chuỗi biểu thị ID của rãnh cần định vị trong danh sách rãnh.

### Giá trị trả về

Một đối tượng {{domxref("AudioTrack")}} biểu thị rãnh đầu tiên được tìm thấy trong `AudioTrackList` có `id` khớp với chuỗi đã chỉ định. Nếu không tìm thấy kết quả khớp, phương thức này trả về `null`.

Các rãnh được tìm theo thứ tự tự nhiên của chúng; tức là theo thứ tự do chính tài nguyên media xác định hoặc, nếu tài nguyên không xác định thứ tự, theo thứ tự tương đối mà các rãnh được khai báo bởi tài nguyên media.

## Ví dụ

Ví dụ này gợi ý về một trò chơi giả định trong đó phim được dùng làm đoạn cắt cảnh hoặc các phân đoạn quan trọng khác trong trò chơi. Mỗi bộ phim có một rãnh âm thanh cho từng nhân vật, cũng như một rãnh cho nhạc nền, hiệu ứng âm thanh, v.v. Hàm này cho phép trò chơi tắt âm thanh của một nhân vật cụ thể để điều chỉnh trải nghiệm của bộ phim dựa trên các tình huống xảy ra trong trò chơi; nếu lời thoại của nhân vật đó không liên quan, nó sẽ bị lược bỏ. Rõ ràng điều này sẽ đòi hỏi thiết kế đồ họa khá khéo léo để hoạt động, nhưng đây chỉ là một trò chơi giả định.

```js
function disableCharacter(videoElem, characterName) {
  videoElem.audioTracks.getTrackById(characterName).enabled = false;
}
```

Hàm ngắn này lấy {{domxref("AudioTrackList")}} chứa các rãnh âm thanh của video bằng {{domxref("HTMLMediaElement.audioTracks")}}, sau đó gọi `getTrackById()` trên đối tượng đó, chỉ định tên của nhân vật. Âm thanh của rãnh kết quả sau đó bị tắt bằng cách đặt cờ {{domxref("AudioTrack.enabled", "enabled")}} của nó thành `false`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
