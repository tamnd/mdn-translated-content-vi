---
title: "MediaDevices: getDisplayMedia() method"
short-title: getDisplayMedia()
slug: Web/API/MediaDevices/getDisplayMedia
page-type: web-api-instance-method
browser-compat: api.MediaDevices.getDisplayMedia
---

{{APIRef("Screen Capture API")}}{{SecureContext_Header}}

Phương thức **`getDisplayMedia()`** của giao diện {{domxref("MediaDevices")}} nhắc người dùng chọn và cấp quyền thu lại nội dung của một màn hình hoặc một phần màn hình đó (chẳng hạn như một cửa sổ) dưới dạng {{domxref("MediaStream")}}.

Luồng kết quả sau đó có thể được ghi lại bằng [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API) hoặc được truyền đi như một phần của phiên [WebRTC](/en-US/docs/Web/API/WebRTC_API).

Xem [Using the Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture) để biết thêm chi tiết và ví dụ.

## Cú pháp

```js-nolint
getDisplayMedia()
getDisplayMedia(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các yêu cầu cho {{domxref("MediaStream")}} trả về.
    Các tùy chọn của `getDisplayMedia()` hoạt động giống như [constraints](/en-US/docs/Web/API/MediaDevices/getUserMedia#parameters) cho phương thức {{domxref("MediaDevices.getUserMedia()")}}, mặc dù trong trường hợp đó chỉ có thể chỉ định `audio` và `video`.
    Danh sách các thuộc tính tùy chọn có thể dùng cho `getDisplayMedia()` như sau:
    - `video` {{optional_inline}}
      - : Một boolean hoặc một thể hiện {{domxref("MediaTrackConstraints")}}; giá trị mặc định là `true`.
        Nếu tùy chọn này bị bỏ qua hoặc đặt thành `true`, {{domxref("MediaStream")}} trả về sẽ chứa một track video.
        Vì `getDisplayMedia()` yêu cầu một track video, nếu tùy chọn này được đặt thành `false` thì promise sẽ bị reject với `TypeError`.
    - `audio` {{optional_inline}}
      - : Một boolean hoặc một thể hiện {{domxref("MediaTrackConstraints")}}; giá trị mặc định là `false`.
        Giá trị `true` cho biết {{domxref("MediaStream")}} trả về sẽ chứa một track audio, nếu audio được hỗ trợ và có sẵn cho bề mặt hiển thị mà người dùng chọn.
    - `controller` {{Experimental_Inline}} {{optional_inline}}
      - : Một thể hiện đối tượng {{domxref("CaptureController")}} chứa các phương thức có thể dùng để thao tác thêm phiên thu lại nếu được bao gồm.
    - `monitorTypeSurfaces` {{Experimental_Inline}} {{optional_inline}}
      - : Một giá trị liệt kê chỉ định liệu trình duyệt có nên đưa toàn bộ màn hình vào các tùy chọn thu màn hình được trình bày cho người dùng bên cạnh các tùy chọn tab và cửa sổ hay không.
        Tùy chọn này nhằm bảo vệ công ty khỏi rò rỉ thông tin riêng tư do lỗi của nhân viên khi dùng các ứng dụng họp video.
        Các giá trị có thể là:
        - `include`: Gợi ý rằng trình duyệt nên bao gồm các tùy chọn màn hình.
        - `exclude`: Gợi ý rằng các tùy chọn màn hình nên bị loại trừ.

        > [!NOTE]
        > Bạn không thể đặt `monitorTypeSurfaces: "exclude"` cùng lúc với [`displaySurface: "monitor"`](/en-US/docs/Web/API/MediaTrackConstraints/displaySurface) vì hai thiết lập này mâu thuẫn nhau.
        > Nếu làm vậy, lời gọi `getDisplayMedia()` sẽ thất bại với `TypeError`.

    - `preferCurrentTab` {{non-standard_inline}} {{Experimental_Inline}} {{optional_inline}}
      - : Một boolean; giá trị `true` yêu cầu trình duyệt ưu tiên hiển thị tab hiện tại như nguồn thu chính, tức là như một tùy chọn riêng "This Tab" trong các tùy chọn "Choose what to share" được trình bày cho người dùng.
        Điều này hữu ích vì nhiều loại ứng dụng thường chỉ muốn chia sẻ tab hiện tại.
        Ví dụ, một ứng dụng trình chiếu có thể muốn cho phép người dùng phát trực tiếp tab hiện tại đang chứa bản trình bày tới một cuộc họp ảo.
    - `selfBrowserSurface` {{Experimental_Inline}} {{optional_inline}}
      - : Một giá trị liệt kê chỉ định liệu trình duyệt có cho phép người dùng chọn tab hiện tại để thu lại hay không.
        Điều này giúp tránh hiệu ứng "phòng gương vô tận" mà một ứng dụng họp video vô tình chia sẻ chính màn hình của nó.
        Các giá trị có thể là:
        - `include`: Gợi ý rằng trình duyệt nên bao gồm tab hiện tại trong các lựa chọn được cung cấp cho việc thu lại.
        - `exclude`: Gợi ý rằng tab hiện tại nên bị loại trừ khỏi các lựa chọn.
    - `surfaceSwitching` {{Experimental_Inline}} {{optional_inline}}
      - : Một giá trị liệt kê chỉ định liệu trình duyệt có hiển thị điều khiển cho phép người dùng chuyển đổi động tab được chia sẻ trong lúc chia sẻ màn hình hay không.
        Điều này tiện hơn so với việc phải thực hiện lại toàn bộ quy trình chia sẻ mỗi lần người dùng muốn chuyển tab được chia sẻ.
        Các giá trị có thể là:
        - `include`: Gợi ý rằng trình duyệt nên bao gồm điều khiển.
        - `exclude`: Gợi ý rằng điều khiển không nên được hiển thị.
    - `systemAudio` {{Experimental_Inline}} {{optional_inline}}
      - : Một giá trị liệt kê chỉ định liệu trình duyệt có nên bao gồm âm thanh hệ thống trong số các nguồn âm thanh có thể cung cấp cho người dùng hay không.
        Các giá trị có thể là:
        - `include`: Gợi ý rằng trình duyệt nên bao gồm âm thanh hệ thống trong danh sách lựa chọn.
        - `exclude`: Gợi ý rằng âm thanh hệ thống nên bị loại khỏi các lựa chọn được hiển thị.
    - `windowAudio` {{Experimental_Inline}} {{optional_inline}}
      - : Một giá trị liệt kê gợi ý cho trình duyệt biết tùy chọn chia sẻ âm thanh nào nên được trình bày cho người dùng cùng với các tùy chọn chia sẻ cửa sổ. Các giá trị có thể là:
        - `exclude`: Gợi ý rằng âm thanh không nên có thể chia sẻ khi chọn tùy chọn chia sẻ cửa sổ.
        - `window`: Gợi ý rằng khi chọn tùy chọn chia sẻ cửa sổ, chỉ âm thanh bắt nguồn từ chính cửa sổ đó nên được chia sẻ.
        - `system`: Gợi ý rằng khi chọn tùy chọn chia sẻ cửa sổ, toàn bộ âm thanh hệ thống nên được chia sẻ.

> [!NOTE]
> Với hầu hết các tùy chọn này, đặc tả không quy định giá trị mặc định. Đối với các tùy chọn độc lập, nếu không có giá trị mặc định được nhắc đến, hãy xem phần [Tương thích trình duyệt](#browser_compatibility) để biết các giá trị mặc định theo từng trình duyệt.

> [!NOTE]
> Xem bài viết [Capabilities, constraints, and settings](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints) để biết thêm chi tiết về cách các tùy chọn này hoạt động.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolve thành một {{domxref("MediaStream")}} chứa một track video có nội dung lấy từ vùng màn hình do người dùng chọn, cùng với một track audio tùy chọn.

> [!NOTE]
> Hỗ trợ của trình duyệt cho các track audio khác nhau, cả về việc chúng có được hỗ trợ hay không bởi media recorder lẫn về các nguồn audio được hỗ trợ.
> Kiểm tra [bảng tương thích](#browser_compatibility) để biết chi tiết cho từng trình duyệt.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Được ném nếu lỗi hoặc thất bại không khớp với bất kỳ ngoại lệ nào khác được liệt kê ở đây.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu lời gọi `getDisplayMedia()` không được thực hiện từ mã chạy do một {{glossary("transient activation")}}, chẳng hạn như một trình xử lý sự kiện.
    Hoặc nếu ngữ cảnh trình duyệt không hoạt động đầy đủ hoặc không có focus.
    Hoặc nếu tùy chọn `controller` đã được dùng để tạo một {{domxref("MediaStream")}} khác.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu quyền truy cập vào một vùng màn hình bị người dùng từ chối, hoặc phiên duyệt hiện tại không được phép truy cập chia sẻ màn hình (ví dụ bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)).
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu không có nguồn video màn hình nào sẵn sàng để thu lại.
- `NotReadableError` {{domxref("DOMException")}}
  - : Được ném nếu người dùng chọn một màn hình, cửa sổ, tab hoặc nguồn dữ liệu màn hình khác, nhưng xảy ra lỗi hoặc khóa ở mức phần cứng hay hệ điều hành, ngăn việc chia sẻ nguồn đã chọn.
- `OverconstrainedError` {{domxref("DOMException")}}
  - : Được ném nếu, sau khi tạo stream, việc áp dụng bất kỳ constraints nào được chỉ định bị thất bại vì không thể tạo ra stream tương thích.
- {{jsxref("TypeError")}}
  - : Được ném nếu `options` được chỉ định chứa các giá trị không được phép khi gọi `getDisplayMedia()`, ví dụ thuộc tính `video` được đặt thành false, hoặc nếu bất kỳ {{domxref("MediaTrackConstraints")}} nào được chỉ định không được phép.
    Giá trị `min` và `exact` không được phép trong constraints dùng trong các lời gọi `getDisplayMedia()`.

## Bảo mật

Vì `getDisplayMedia()` có thể bị lạm dụng theo những cách độc hại, nó có thể là nguồn gốc của các mối lo ngại đáng kể về quyền riêng tư và bảo mật.
Vì lý do đó, đặc tả nêu rõ các biện pháp mà trình duyệt phải thực hiện để hỗ trợ đầy đủ `getDisplayMedia()`.

- Các tùy chọn được chỉ định không thể dùng để giới hạn các lựa chọn có sẵn cho người dùng.
  Thay vào đó, chúng phải được áp dụng sau khi người dùng chọn nguồn, để tạo ra đầu ra khớp với các tùy chọn.
- Quyền cho phép dùng `getDisplayMedia()` không thể được lưu lại để tái sử dụng.
  Người dùng phải được nhắc xin quyền mỗi lần.
- [Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation) là bắt buộc.
  Người dùng phải tương tác với trang hoặc một phần tử giao diện để tính năng này hoạt động.
- Trình duyệt được khuyến khích hiển thị cảnh báo cho người dùng về việc chia sẻ màn hình hoặc cửa sổ có chứa trình duyệt, và theo dõi sát nội dung khác có thể bị thu lại và hiển thị cho người dùng khác.

## Ví dụ

Trong ví dụ dưới đây, một phương thức `startCapture()` được tạo ra để khởi động thu màn hình dựa trên bộ tùy chọn được chỉ định bởi tham số `displayMediaOptions`.

```js
const displayMediaOptions = {
  video: {
    displaySurface: "browser",
  },
  audio: {
    suppressLocalAudioPlayback: false,
  },
  preferCurrentTab: false,
  selfBrowserSurface: "exclude",
  systemAudio: "include",
  surfaceSwitching: "include",
  monitorTypeSurfaces: "include",
};

async function startCapture(displayMediaOptions) {
  let captureStream;

  try {
    captureStream =
      await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
  } catch (err) {
    console.error(`Error: ${err}`);
  }
  return captureStream;
}
```

Ví dụ này dùng {{jsxref("Operators/await", "await")}} để chờ bất đồng bộ `getDisplayMedia()` resolve thành một {{domxref("MediaStream")}} chứa nội dung màn hình theo các tùy chọn đã chỉ định.
Sau đó stream được trả về cho bên gọi để sử dụng, chẳng hạn để thêm vào một cuộc gọi WebRTC bằng {{domxref("RTCPeerConnection.addTrack()")}} nhằm thêm track video từ stream.

> [!NOTE]
> Bản demo [Screen sharing controls](https://chrome.dev/screen-sharing-controls/) cung cấp một triển khai hoàn chỉnh cho phép bạn tạo một bản thu màn hình với bộ constraints và tùy chọn `getDisplayMedia()` do bạn chọn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}}: Thu media từ
  camera và/hoặc microphone
