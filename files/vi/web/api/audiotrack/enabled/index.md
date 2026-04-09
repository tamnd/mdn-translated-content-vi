---
title: "AudioTrack: thuộc tính enabled"
short-title: enabled
slug: Web/API/AudioTrack/enabled
page-type: web-api-instance-property
browser-compat: api.AudioTrack.enabled
---

{{APIRef("HTML DOM")}}

Thuộc tính **{{domxref("AudioTrack")}}** **`enabled`** chỉ định rãnh âm thanh được mô tả hiện có đang được bật để sử dụng hay không. Nếu rãnh bị vô hiệu hóa bằng cách đặt `enabled` thành `false`, rãnh sẽ bị tắt tiếng và không phát ra âm thanh.

## Giá trị

Thuộc tính `enabled` là một giá trị Boolean, có giá trị `true` nếu rãnh đang được bật; các rãnh được bật sẽ phát âm thanh khi phương tiện đang phát. Đặt `enabled` thành `false` về thực chất sẽ tắt tiếng rãnh âm thanh, ngăn nó đóng góp vào phần âm thanh của phương tiện.

## Ví dụ

Ví dụ này chuyển đổi giữa rãnh âm thanh chính và rãnh bình luận của một phần tử phương tiện.

```js
function swapCommentaryMain() {
  const videoElem = document.getElementById("main-video");
  let audioTrackMain;
  let audioTrackCommentary;

  videoElem.audioTracks.forEach((track) => {
    if (track.kind === "main") {
      audioTrackMain = track;
    } else if (track.kind === "commentary") {
      audioTrackCommentary = track;
    }
  });

  if (audioTrackMain && audioTrackCommentary) {
    const commentaryEnabled = audioTrackCommentary.enabled;
    audioTrackCommentary.enabled = audioTrackMain.enabled;
    audioTrackMain.enabled = commentaryEnabled;
  }
}
```

Hàm `swapCommentaryMain()` ở trên tìm trong các rãnh âm thanh của phần tử {{HTMLElement("video")}} `"main-video"` những rãnh âm thanh có giá trị {{domxref("AudioTrack.kind", "kind")}} là `"main"` và `"commentary"`. Chúng lần lượt biểu diễn rãnh âm thanh chính và rãnh bình luận.

> [!NOTE]
> Ví dụ này giả định rằng trong video chỉ có một rãnh cho mỗi loại, nhưng thực tế không nhất thiết luôn như vậy.

Các rãnh âm thanh của phần tử sau đó được duyệt bằng phương thức JavaScript {{jsxref("Array.forEach", "forEach()")}} (mặc dù thuộc tính {{domxref("HTMLMediaElement.audioTracks", "audioTracks")}} của một phần tử phương tiện thực ra không phải là một mảng JavaScript, nhưng phần lớn vẫn có thể được truy cập tương tự như mảng).

Quá trình duyệt tìm các rãnh có giá trị {{domxref("AudioTrack.kind", "kind")}} là `"main"` và `"commentary"` rồi ghi nhớ các đối tượng {{domxref("AudioTrack")}} đó. Sau khi tìm thấy, giá trị của thuộc tính `enabled` của hai rãnh sẽ được hoán đổi, nhờ đó đổi rãnh nào trong hai rãnh hiện đang hoạt động.

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
