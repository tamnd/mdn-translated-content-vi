---
title: "HTMLMediaElement: thuộc tính videoTracks"
short-title: videoTracks
slug: Web/API/HTMLMediaElement/videoTracks
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.videoTracks
---

{{APIRef("HTML DOM")}}

Chỉ đọc **`videoTracks`**
thuộc tính trên đối tượng {{DOMxRef("HTMLMediaElement")}} trả về một
{{DOMxRef("VideoTrackList")}} object listing all of the {{DOMxRef("VideoTrack")}}
các đối tượng đại diện cho các bản nhạc video của phần tử đa phương tiện.

Danh sách trả về là _live_; nghĩa là, khi các bản nhạc được thêm vào và xóa khỏi
phần tử phương tiện, nội dung của danh sách sẽ thay đổi linh hoạt. Một khi bạn có một tài liệu tham khảo đến
danh sách, bạn có thể theo dõi những thay đổi để phát hiện khi nào các bản nhạc video mới được thêm vào hoặc
những cái hiện có bị loại bỏ. Xem [VideoTrackList events](/en-US/docs/Web/API/VideoTrackList#events)
để tìm hiểu thêm về cách theo dõi các thay đổi đối với danh sách theo dõi của phần tử phương tiện.

## Giá trị

Một đối tượng {{DOMxRef("VideoTrackList")}} đại diện cho danh sách các bản nhạc video được bao gồm
trong yếu tố truyền thông. Danh sách các bản nhạc có thể được truy cập bằng cách sử dụng ký hiệu mảng hoặc sử dụng
phương thức {{domxref("VideoTrackList.getTrackById", "getTrackById()")}} của đối tượng.

Mỗi bản nhạc được thể hiện bằng một đối tượng {{DOMxRef("VideoTrack")}} cung cấp
thông tin về đường đua.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.videoTracks`
- {{HTMLElement("video")}}
- {{DOMxRef("VideoTrack")}}, {{DOMxRef("VideoTrackList")}}
