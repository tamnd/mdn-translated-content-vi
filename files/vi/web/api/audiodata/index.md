---
title: AudioData
slug: Web/API/AudioData
page-type: web-api-interface
browser-compat: api.AudioData
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`AudioData`** của [WebCodecs API](/en-US/docs/Web/API/WebCodecs_API) biểu diễn một mẫu âm thanh.

`AudioData` là một [đối tượng có thể chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Mô tả

Một rãnh âm thanh bao gồm một luồng các mẫu âm thanh, trong đó mỗi mẫu biểu diễn một khoảnh khắc âm thanh đã được ghi lại. Một đối tượng `AudioData` là cách biểu diễn của một mẫu như vậy. Khi làm việc cùng với các giao diện của [Insertable Streams API](/en-US/docs/Web/API/Insertable_Streams_for_MediaStreamTrack_API), bạn có thể chia một luồng thành các đối tượng `AudioData` riêng lẻ bằng {{domxref("MediaStreamTrackProcessor")}}, hoặc tạo một rãnh âm thanh từ một luồng khung mẫu bằng {{domxref("MediaStreamTrackGenerator")}}.

> [!NOTE]
> Tìm hiểu thêm về âm thanh trên web trong [Các khái niệm về âm thanh số](/en-US/docs/Web/Media/Guides/Formats/Audio_concepts).

### Tài nguyên đa phương tiện

Một đối tượng `AudioData` chứa một tham chiếu đến **tài nguyên đa phương tiện** được gắn kèm. Tài nguyên đa phương tiện này chứa dữ liệu mẫu âm thanh thực tế mà đối tượng mô tả. Một tài nguyên đa phương tiện được user agent duy trì cho đến khi không còn được một đối tượng `AudioData` nào tham chiếu tới nữa, ví dụ khi gọi {{domxref("AudioData.close()")}}.

### Các mặt phẳng và định dạng âm thanh

Để lấy định dạng mẫu của một `AudioData`, hãy dùng thuộc tính {{domxref("AudioData.format")}}. Định dạng có thể được mô tả là **xen kẽ** (interleaved) hoặc **phẳng** (planar). Trong các định dạng xen kẽ, các mẫu âm thanh từ những kênh khác nhau được bố trí trong một bộ đệm duy nhất, gọi là một **plane**. Plane này chứa số phần tử bằng {{domxref("AudioData.numberOfFrames")}} \* {{domxref("AudioData.numberOfChannels")}}.

Trong định dạng phẳng, số lượng plane bằng {{domxref("AudioData.numberOfChannels")}}, và mỗi plane là một bộ đệm chứa số phần tử bằng {{domxref("AudioData.numberOfFrames")}}.

## Hàm tạo

- {{domxref("AudioData.AudioData", "AudioData()")}}
  - : Tạo một đối tượng `AudioData` mới.

## Thuộc tính thể hiện

- {{domxref("AudioData.format")}} {{ReadOnlyInline}}
  - : Trả về định dạng mẫu của âm thanh.
- {{domxref("AudioData.sampleRate")}} {{ReadOnlyInline}}
  - : Trả về tốc độ lấy mẫu của âm thanh theo Hz.
- {{domxref("AudioData.numberOfFrames")}} {{ReadOnlyInline}}
  - : Trả về số khung mẫu.
- {{domxref("AudioData.numberOfChannels")}} {{ReadOnlyInline}}
  - : Trả về số kênh âm thanh.
- {{domxref("AudioData.duration")}} {{ReadOnlyInline}}
  - : Trả về thời lượng của âm thanh theo micro giây.
- {{domxref("AudioData.timestamp")}} {{ReadOnlyInline}}
  - : Trả về dấu thời gian của âm thanh theo micro giây.

## Phương thức thể hiện

- {{domxref("AudioData.allocationSize()")}}
  - : Trả về số byte cần thiết để chứa mẫu sau khi được lọc theo các tùy chọn truyền vào phương thức.
- {{domxref("AudioData.copyTo()")}}
  - : Sao chép các mẫu từ plane được chỉ định của đối tượng `AudioData` sang đích.
- {{domxref("AudioData.clone()")}}
  - : Tạo một đối tượng `AudioData` mới có tham chiếu đến cùng tài nguyên đa phương tiện với đối tượng gốc.
- {{domxref("AudioData.close()")}}
  - : Xóa mọi trạng thái và giải phóng tham chiếu đến tài nguyên đa phương tiện.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
