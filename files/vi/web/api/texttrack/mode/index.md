---
title: "TextTrack: mode property"
short-title: mode
slug: Web/API/TextTrack/mode
page-type: web-api-instance-property
browser-compat: api.TextTrack.mode
---

{{APIRef("WebVTT")}}

Thuộc tính **`mode`** của giao diện {{domxref("TextTrack")}} là một chuỗi chỉ định và kiểm soát chế độ của text track: `disabled`, `hidden`, hoặc `showing`. Bạn có thể đọc giá trị này để xác định chế độ hiện tại, và bạn có thể thay đổi giá trị này để chuyển đổi chế độ.

Safari ngoài ra yêu cầu thuộc tính boolean **`default`** phải được đặt thành true khi triển khai điều khiển trình phát video của riêng bạn để các cue phụ đề được hiển thị.

## Giá trị

Một chuỗi cho biết chế độ hiện tại của track. Một trong các giá trị sau:

- `disabled`
  - : Text track hiện đang bị tắt. Trong khi sự hiện diện của track được hiển thị trong DOM, tác nhân người dùng sẽ bỏ qua nó. Không có cue nào đang hoạt động, không có sự kiện nào đang được kích hoạt, và tác nhân người dùng sẽ không cố gắng lấy các cue của track. Đây là giá trị mặc định, trừ khi thuộc tính boolean [`default`](/en-US/docs/Web/HTML/Reference/Elements/track#default) của text track được chỉ định, trong trường hợp đó mặc định là `showing`.
- `hidden`
  - : Text track hiện đang hoạt động nhưng các cue không được hiển thị. Nếu tác nhân người dùng chưa thử lấy các cue của track, nó sẽ làm như vậy sớm (từ đó điền vào thuộc tính {{domxref("TextTrack.cues")}} của track). Tác nhân người dùng đang duy trì danh sách các cue đang hoạt động (trong thuộc tính {{domxref("TextTrack.activeCues", "activeCues")}} của track) và các sự kiện đang được kích hoạt tại thời điểm tương ứng, mặc dù văn bản không được hiển thị.
- `showing`
  - : Text track hiện đang được bật và hiển thị. Nếu danh sách cue của track chưa được lấy, nó sẽ được lấy sớm. Danh sách {{domxref("TextTrack.activeCues", "activeCues")}} đang được duy trì và các sự kiện đang kích hoạt tại các thời điểm thích hợp; văn bản của track cũng đang được vẽ phù hợp dựa trên style và {{domxref("TextTrack.kind", "kind")}} của track. Đây là giá trị mặc định nếu thuộc tính boolean [`default`](/en-US/docs/Web/HTML/Reference/Elements/track#default) của text track được chỉ định.

## Ghi chú sử dụng

`mode` mặc định là `disabled`, trừ khi thuộc tính boolean [`default`](/en-US/docs/Web/HTML/Reference/Elements/track#default) được chỉ định, trong trường hợp đó `mode` mặc định là `showing`. Khi một text track được tải ở trạng thái `disabled`, file WebVTT tương ứng không được tải cho đến khi trạng thái thay đổi thành `showing` hoặc `hidden`. Bằng cách này, việc tải tài nguyên và sử dụng bộ nhớ được tránh trừ khi các cue thực sự cần thiết.

Tuy nhiên, điều đó có nghĩa là nếu bạn muốn thực hiện bất kỳ hành động nào liên quan đến các cue của track trong khi xử lý, ví dụ sự kiện {{domxref("Window/load_event", "load")}}, và chế độ track ban đầu là `disabled`, bạn sẽ phải thay đổi `mode` thành `hidden` hoặc `showing` để kích hoạt việc tải các cue.

Khi chế độ là `showing`, text track được thực thi. Giao diện và cách thực thi chính xác tùy thuộc vào {{domxref("TextTrack.kind", "kind")}} của mỗi text track. Nói chung:

- Các track có `kind` là `"subtitles"` hoặc `"captions"` được hiển thị với các cue phủ lên trên video.
- Các track có `kind` là `"descriptions"` được trình bày ở dạng phi thị giác (ví dụ, văn bản có thể được đọc để mô tả hành động trong video).
- Các track có `kind` là `"chapters"` được tác nhân người dùng hoặc trang web/ứng dụng web sử dụng để xây dựng và trình bày giao diện để điều hướng các chương được đặt tên, trong đó mỗi cue trong danh sách đại diện cho một chương trong media.

## Ví dụ

Trong ví dụ này, chúng ta cấu hình các cue của text track để mỗi khi một cue kết thúc, video tự động tạm dừng phát lại. Điều này đư��c thực hiện bằng cách đặt thuộc tính {{domxref("TextTrackCue.pauseOnExit", "pauseOnExit")}} trên mỗi cue thành `true`. Tuy nhiên, để đảm bảo các cue của track có sẵn, trước tiên chúng ta đặt `mode` thành `showing`.

```js
let trackElem = document.querySelector("track");
let track = trackElem.track;

track.mode = "showing";

for (const cue of track.cues) {
  cue.pauseOnExit = true;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVTT](/en-US/docs/Web/API/WebVTT_API)
- {{domxref("TextTrack")}}
- {{domxref("TextTrackList")}}
- {{domxref("TextTrackCueList")}}
- {{domxref("VTTCue")}}
- {{HTMLElement("track")}}
- {{domxref("HTMLTrackElement")}}
