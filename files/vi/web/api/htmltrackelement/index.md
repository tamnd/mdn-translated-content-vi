---
title: HTMLTrackElement
slug: Web/API/HTMLTrackElement
page-type: web-api-interface
browser-compat: api.HTMLTrackElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLTrackElement`** đại diện cho phần tử {{Glossary("HTML")}} {{HTMLElement("track")}} trong {{Glossary("DOM")}}. Phần tử này có thể được sử dụng như một phần tử con của {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}} để chỉ định một text track chứa thông tin như phụ đề hoặc chú thích.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLTrackElement.kind")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`kind`](/en-US/docs/Web/HTML/Reference/Elements/track#kind), cho biết text track được sử dụng như thế nào. Các giá trị có thể là: `subtitles`, `captions`, `descriptions`, `chapters` hoặc `metadata`.
- {{domxref("HTMLTrackElement.src")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`src`](/en-US/docs/Web/HTML/Reference/Elements/track#src), cho biết địa chỉ của dữ liệu text track.
- {{domxref("HTMLTrackElement.srclang")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`srclang`](/en-US/docs/Web/HTML/Reference/Elements/track#srclang), cho biết ngôn ngữ của dữ liệu text track.
- {{domxref("HTMLTrackElement.label")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`label`](/en-US/docs/Web/HTML/Reference/Elements/track#label), cho biết tiêu đề mà người dùng có thể đọc được của track.
- {{domxref("HTMLTrackElement.default")}}
  - : Một giá trị boolean phản ánh thuộc tính [`default`](/en-US/docs/Web/HTML/Reference/Elements/track#default), cho biết rằng track sẽ được bật nếu tùy chọn của người dùng không chỉ ra rằng một track khác sẽ phù hợp hơn.
- {{domxref("HTMLTrackElement.readyState")}} {{ReadOnlyInline}}
  - : Trả về một `unsigned short` cho thấy trạng thái sẵn sàng của track:

    | Hằng số   | Giá trị | Mô tả                                                                                                                                                                             |
    | --------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | `NONE`    | 0       | Cho biết các cue của text track chưa được tải.                                                                                                                                    |
    | `LOADING` | 1       | Cho biết text track đang được tải và chưa gặp lỗi nghiêm trọng nào. Các cue có thể vẫn được thêm vào track bởi trình phân tích cú pháp.                                           |
    | `LOADED`  | 2       | Cho biết text track đã được tải mà không có lỗi nghiêm trọng nào.                                                                                                                 |
    | `ERROR`   | 3       | Cho biết text track đã được bật, nhưng khi user agent cố gắng lấy nó, điều này đã thất bại theo một cách nào đó. Một số hoặc tất cả các cue có thể bị thiếu và sẽ không được lấy. |

- {{domxref("HTMLTrackElement.track")}} {{ReadOnlyInline}}
  - : Trả về {{Domxref("TextTrack")}} là dữ liệu text track của phần tử track.

## Phương thức phiên bản

_Không có phương thức đặc thù; kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Sự kiện

_Kế thừa các sự kiện từ phần tử cha, {{domxref("HTMLElement")}}._

Nghe các sự kiện này bằng {{domxref("EventTarget/addEventListener", "addEventListener()")}} hoặc bằng cách gán trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này:

- {{domxref("HTMLTrackElement.cuechange_event", "cuechange")}}
  - : Được gửi khi {{domxref("TextTrack")}} bên dưới đã thay đổi các cue đang hiển thị. Sự kiện này luôn được gửi đến `TextTrack` nhưng _cũng_ được gửi đến `HTMLTrackElement` nếu có phần tử liên quan đến track.
    Bạn cũng có thể sử dụng trình xử lý sự kiện `oncuechange` để thiết lập trình xử lý cho sự kiện này.

## Ghi chú sử dụng

### Tải tài nguyên văn bản của track

Dữ liệu WebVTT hoặc TTML mô tả các cue thực sự cho text track không được tải nếu `mode` của track ban đầu ở trạng thái `disabled`. Nếu bạn cần xử lý track sau khi `<track>` được thiết lập, bạn nên đảm bảo rằng `mode` của track là `hidden` (nếu bạn không muốn nó bắt đầu được trình bày cho người dùng) hoặc `showing` (để hiển thị track ban đầu). Sau đó bạn có thể thay đổi mode theo mong muốn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("track") }}.
