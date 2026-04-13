---
title: Insertable Streams for MediaStreamTrack API
slug: Web/API/Insertable_Streams_for_MediaStreamTrack_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.VideoTrackGenerator
spec-urls: https://w3c.github.io/mediacapture-transform/
---

{{DefaultAPISidebar("Insertable Streams for MediaStreamTrack API")}}{{SeeCompatTable}}{{AvailableInWorkers("dedicated")}}

**Insertable Streams for MediaStreamTrack API** cung cấp cách xử lý các khung video của {{domxref("MediaStreamTrack")}} khi chúng được tiêu thụ.

## Khái niệm và cách sử dụng

Khi xử lý video theo thời gian thực, đôi khi bạn muốn chèn các phần tử trực quan hoặc xử lý luồng khung video theo cách khác. Ví dụ, một ứng dụng có thể bao gồm hai track cần được kết hợp, chẳng hạn như bản đồ thời tiết và video của người trình bày giải thích bản đồ. Hoặc bạn có thể muốn xử lý track để làm mờ nền, hoặc giới thiệu các phần tử khác. Các API được mô tả ở đây cung cấp quyền truy cập trực tiếp vào luồng video, cho phép bạn thao tác nó theo thời gian thực.

Để đảm bảo hiệu suất tối ưu, các API chỉ có sẵn trong [dedicated workers](/en-US/docs/Web/API/DedicatedWorkerGlobalScope) (trừ khi có ghi chú khác).

## Các giao diện

- {{domxref("MediaStreamTrackProcessor")}} {{Experimental_Inline}}
  - : Tiêu thụ nguồn của đối tượng {{domxref("MediaStreamTrack")}} và tạo ra luồng các khung video.
- {{domxref("VideoTrackGenerator")}} {{Experimental_Inline}}
  - : Tạo một {{domxref("WritableStream")}} hoạt động như một nguồn video {{domxref("MediaStreamTrack")}}.
- {{domxref("MediaStreamTrackGenerator")}} {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Tạo một {{domxref("WritableStream")}} hoạt động như một nguồn {{domxref("MediaStreamTrack")}} cho video hoặc âm thanh. Chỉ có sẵn trên {{Glossary("main thread")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
