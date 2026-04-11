---
title: MediaTrackConstraints
slug: Web/API/MediaTrackConstraints
page-type: web-api-interface
spec-urls:
  - https://w3c.github.io/mediacapture-main/#dom-mediatrackconstraints
  - https://w3c.github.io/mediacapture-screen-share/#extensions-to-mediatrackconstraintset
---

{{APIRef("Media Capture and Streams")}}

Từ điển **`MediaTrackConstraints`** được dùng để mô tả một tập hợp các khả năng phương tiện và giá trị hoặc các giá trị mà mỗi khả năng có thể nhận.

Một từ điển ràng buộc được truyền vào phương thức {{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}} của giao diện {{domxref("MediaStreamTrack")}} để cho phép một script thiết lập tập hợp các giá trị chính xác (bắt buộc) hoặc các phạm vi và/hoặc các giá trị ưu tiên hoặc phạm vi giá trị ưu tiên cho rãnh.

Tập hợp ràng buộc tùy chỉnh được yêu cầu gần nhất có thể được truy xuất bằng cách gọi {{domxref("MediaStreamTrack.getConstraints", "getConstraints()")}}.

Các đối tượng kiểu này cũng có thể được truyền vào:

- Phương thức {{domxref("MediaDevices.getUserMedia()")}}, để chỉ định các ràng buộc trên luồng phương tiện được yêu cầu từ phần cứng như camera hoặc micro.

- Phương thức {{domxref("MediaDevices.getDisplayMedia()")}}, để chỉ định các ràng buộc trên luồng phương tiện được yêu cầu từ việc chụp màn hình hoặc cửa sổ.

## Ràng buộc

Các kiểu sau đây được dùng để chỉ định một ràng buộc cho một thuộc tính. Chúng cho phép bạn chỉ định một hoặc nhiều giá trị `exact` mà một trong số đó phải là giá trị của tham số, hoặc một tập hợp các giá trị `ideal` nên được sử dụng nếu có thể. Bạn cũng có thể chỉ định một giá trị duy nhất (hoặc mảng các giá trị) mà user agent sẽ cố gắng khớp sau khi tất cả các ràng buộc nghiêm ngặt hơn đã được áp dụng.

Để tìm hiểu thêm về cách ràng buộc hoạt động, xem [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints).

> [!NOTE]
> Các giá trị `min` và `exact` không được phép trong các ràng buộc dùng trong lệnh gọi {{domxref("MediaDevices.getDisplayMedia()")}} — chúng sẽ tạo ra `TypeError` — nhưng được phép trong các ràng buộc dùng trong lệnh gọi {{domxref("MediaStreamTrack.applyConstraints()")}}.

### ConstrainBoolean

Kiểu ràng buộc `ConstrainBoolean` được dùng để chỉ định ràng buộc cho một thuộc tính có giá trị là Boolean. Giá trị của nó có thể được đặt thành Boolean (`true` hoặc `false`) hoặc một đối tượng chứa các thuộc tính sau:

- `exact`
  - : Boolean phải là giá trị của thuộc tính. Nếu thuộc tính không thể được đặt thành giá trị này, quá trình khớp sẽ thất bại.
- `ideal`
  - : Boolean chỉ định giá trị lý tưởng cho thuộc tính. Nếu có thể, giá trị này sẽ được sử dụng, nhưng nếu không thể, user agent sẽ sử dụng kết quả khớp gần nhất có thể.

### ConstrainBooleanOrDOMString

Kiểu ràng buộc `ConstrainBooleanOrDOMString` được dùng để chỉ định ràng buộc cho một thuộc tính có giá trị là Boolean hoặc chuỗi. Nó có thể nhận các giá trị như được chỉ định trong các phần [`ConstrainBoolean`](#constrainboolean) và [`ConstrainDOMString`](#constraindomstring).

### ConstrainDouble

Kiểu ràng buộc `ConstrainDouble` được dùng để chỉ định ràng buộc cho một thuộc tính có giá trị là số thực dấu phẩy động độ chính xác kép. Giá trị của nó có thể được đặt thành một số hoặc một đối tượng chứa các thuộc tính sau:

- `max`
  - : Số thập phân chỉ định giá trị lớn nhất được phép của thuộc tính mà nó mô tả. Nếu giá trị không thể duy trì bằng hoặc nhỏ hơn giá trị này, quá trình khớp sẽ thất bại.
- `min`
  - : Số thập phân chỉ định giá trị nhỏ nhất được phép của thuộc tính mà nó mô tả. Nếu giá trị không thể duy trì bằng hoặc lớn hơn giá trị này, quá trình khớp sẽ thất bại.
- `exact`
  - : Số thập phân chỉ định một giá trị cụ thể, bắt buộc mà thuộc tính phải có để được chấp nhận.
- `ideal`
  - : Số thập phân chỉ định giá trị lý tưởng cho thuộc tính. Nếu có thể, giá trị này sẽ được sử dụng, nhưng nếu không thể, user agent sẽ sử dụng kết quả khớp gần nhất có thể.

### ConstrainDOMString

Kiểu ràng buộc `ConstrainDOMString` được dùng để chỉ định ràng buộc cho một thuộc tính có giá trị là chuỗi. Giá trị của nó có thể được đặt thành một chuỗi, mảng chuỗi, hoặc một đối tượng chứa các thuộc tính sau:

- `exact`
  - : Chuỗi hoặc mảng chuỗi, một trong số đó phải là giá trị của thuộc tính. Nếu thuộc tính không thể được đặt thành một trong các giá trị được liệt kê, quá trình khớp sẽ thất bại.
- `ideal`
  - : Chuỗi hoặc mảng chuỗi, chỉ định các giá trị lý tưởng cho thuộc tính. Nếu có thể, một trong các giá trị được liệt kê sẽ được sử dụng, nhưng nếu không thể, user agent sẽ sử dụng kết quả khớp gần nhất có thể.

### ConstrainULong

Kiểu ràng buộc `ConstrainULong` được dùng để chỉ định ràng buộc cho một thuộc tính có giá trị là số nguyên. Giá trị của nó có thể được đặt thành một số hoặc một đối tượng chứa các thuộc tính sau:

- `max`
  - : Số nguyên chỉ định giá trị lớn nhất được phép của thuộc tính mà nó mô tả. Nếu giá trị không thể duy trì bằng hoặc nhỏ hơn giá trị này, quá trình khớp sẽ thất bại.
- `min`
  - : Số nguyên chỉ định giá trị nhỏ nhất được phép của thuộc tính mà nó mô tả. Nếu giá trị không thể duy trì bằng hoặc lớn hơn giá trị này, quá trình khớp sẽ thất bại.
- `exact`
  - : Số nguyên chỉ định một giá trị cụ thể, bắt buộc mà thuộc tính phải có để được chấp nhận.
- `ideal`
  - : Số nguyên chỉ định giá trị lý tưởng cho thuộc tính. Nếu có thể, giá trị này sẽ được sử dụng, nhưng nếu không thể, user agent sẽ sử dụng kết quả khớp gần nhất có thể.

## Thuộc tính phiên bản

Một số kết hợp nhất định nhưng không nhất thiết phải là tất cả các thuộc tính sau đây sẽ tồn tại trong đối tượng. Điều này có thể vì trình duyệt không hỗ trợ thuộc tính đó, hoặc vì nó không áp dụng. Ví dụ, vì {{Glossary("RTP")}} không cung cấp một số giá trị trong quá trình thương lượng kết nối WebRTC, một rãnh liên kết với {{domxref("RTCPeerConnection")}} sẽ không bao gồm các giá trị như {{domxref("MediaTrackConstraints.facingMode", "facingMode")}} hay {{domxref("MediaTrackConstraints.groupId", "groupId")}}.

### Thuộc tính phiên bản của tất cả rãnh phương tiện

- {{domxref("MediaTrackConstraints.deviceId", "deviceId")}}
  - : Đối tượng [`ConstrainDOMString`](#constraindomstring) chỉ định ID thiết bị hoặc mảng các ID thiết bị được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.groupId", "groupId")}}
  - : Đối tượng [`ConstrainDOMString`](#constraindomstring) chỉ định ID nhóm hoặc mảng các ID nhóm được chấp nhận và/hoặc yêu cầu.

### Thuộc tính phiên bản của rãnh âm thanh

- {{domxref("MediaTrackConstraints.autoGainControl", "autoGainControl")}}
  - : Đối tượng [`ConstrainBoolean`](#constrainboolean) chỉ định xem kiểm soát độ khuếch đại tự động có được ưu tiên và/hoặc yêu cầu hay không.
- {{domxref("MediaTrackConstraints.channelCount", "channelCount")}}
  - : [`ConstrainULong`](#constrainulong) chỉ định số kênh hoặc phạm vi số kênh được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.echoCancellation", "echoCancellation")}}
  - : Đối tượng [`ConstrainBooleanOrDOMString`](#constrainbooleanordomstring) chỉ định xem khử tiếng vọng có được ưu tiên và/hoặc yêu cầu hay không, và nếu được hỗ trợ, loại nào.
- {{domxref("MediaTrackConstraints.latency", "latency")}}
  - : [`ConstrainDouble`](#constraindouble) chỉ định độ trễ hoặc phạm vi độ trễ được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.noiseSuppression", "noiseSuppression")}}
  - : [`ConstrainBoolean`](#constrainboolean) chỉ định xem triệt tiếng ồn có được ưu tiên và/hoặc yêu cầu hay không.
- {{domxref("MediaTrackConstraints.sampleRate", "sampleRate")}}
  - : [`ConstrainULong`](#constrainulong) chỉ định tốc độ lấy mẫu hoặc phạm vi tốc độ lấy mẫu được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.sampleSize", "sampleSize")}}
  - : [`ConstrainULong`](#constrainulong) chỉ định kích thước mẫu hoặc phạm vi kích thước mẫu được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.volume", "volume")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : [`ConstrainDouble`](#constraindouble) chỉ định âm lượng hoặc phạm vi âm lượng được chấp nhận và/hoặc yêu cầu.

### Thuộc tính phiên bản của rãnh hình ảnh

- `whiteBalanceMode`
  - : {{jsxref("String")}} chỉ định một trong `"none"`, `"manual"`, `"single-shot"`, hoặc `"continuous"`.
- `exposureMode`
  - : {{jsxref("String")}} chỉ định một trong `"none"`, `"manual"`, `"single-shot"`, hoặc `"continuous"`.
- `focusMode`
  - : {{jsxref("String")}} chỉ định một trong `"none"`, `"manual"`, `"single-shot"`, hoặc `"continuous"`.
- `pointsOfInterest`
  - : Tọa độ pixel trên cảm biến của một hoặc nhiều điểm quan tâm. Đây là đối tượng có dạng { x:_value_, y:_value_ } hoặc mảng các đối tượng như vậy, trong đó _value_ là số nguyên độ chính xác kép.
- `exposureCompensation`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định điều chỉnh f-stop lên đến ±3.
- `colorTemperature`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định nhiệt độ màu mong muốn tính bằng độ Kelvin.
- `iso`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định cài đặt ISO mong muốn.
- `brightness`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định cài đặt độ sáng mong muốn.
- `contrast`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định mức độ chênh lệch giữa sáng và tối.
- `saturation`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định mức độ bão hòa màu sắc.
- `sharpness`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định độ sắc nét của các cạnh.
- `focusDistance`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định khoảng cách đến đối tượng được lấy nét.
- `zoom`
  - : [`ConstrainDouble`](#constraindouble) (số nguyên độ chính xác kép) chỉ định tiêu cự mong muốn.
- `torch`
  - : Giá trị boolean xác định xem đèn flash có được kết nối liên tục hay không, nghĩa là đèn bật suốt trong khi rãnh đang hoạt động.

### Thuộc tính phiên bản của rãnh video

- {{domxref("MediaTrackConstraints.aspectRatio", "aspectRatio")}}
  - : [`ConstrainDouble`](#constraindouble) chỉ định {{glossary("aspect ratio")}} video hoặc phạm vi tỷ lệ khung hình được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.facingMode", "facingMode")}}
  - : Đối tượng [`ConstrainDOMString`](#constraindomstring) chỉ định một hướng hoặc mảng các hướng được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.frameRate", "frameRate")}}
  - : [`ConstrainDouble`](#constraindouble) chỉ định tốc độ khung hình hoặc phạm vi tốc độ khung hình được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.height", "height")}}
  - : [`ConstrainULong`](#constrainulong) chỉ định chiều cao video hoặc phạm vi chiều cao được chấp nhận và/hoặc yêu cầu.
- {{domxref("MediaTrackConstraints.width", "width")}}
  - : [`ConstrainULong`](#constrainulong) chỉ định chiều rộng video hoặc phạm vi chiều rộng được chấp nhận và/hoặc yêu cầu.
- `resizeMode`
  - : Đối tượng [`ConstrainDOMString`](#constraindomstring) chỉ định chế độ hoặc mảng các chế độ mà UA có thể dùng để lấy độ phân giải và tốc độ khung hình của rãnh video. Các giá trị được phép là:
    - `crop-and-scale`
      - : User agent có thể dùng cắt xén và thu nhỏ độ phân giải hoặc tốc độ khung hình từ đầu ra thô của phần cứng/hệ điều hành để đáp ứng các ràng buộc khác. Ràng buộc này cho phép các nhà phát triển nhận video đã thu nhỏ ngay cả khi định dạng cụ thể mà ràng buộc của họ chỉ định không được phần cứng hỗ trợ tự nhiên.
    - `none`
      - : User agent sử dụng độ phân giải do phần cứng bên dưới cung cấp, chẳng hạn như camera hoặc driver của nó, hoặc hệ điều hành.

    Nếu `resizeMode` không được chỉ định, trình duyệt sẽ chọn độ phân giải dựa trên [khoảng cách phù hợp](https://w3c.github.io/mediacapture-main/#dfn-fitness-distance) có tính đến các ràng buộc được chỉ định và cả hai giá trị được phép.

### Thuộc tính phiên bản của rãnh chia sẻ màn hình

Các ràng buộc này áp dụng cho thuộc tính `video` của đối tượng được truyền vào {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} để lấy luồng cho chia sẻ màn hình.

- {{domxref("MediaTrackConstraints.displaySurface", "displaySurface")}}
  - : [`ConstrainDOMString`](#constraindomstring) chỉ định các loại bề mặt hiển thị mà người dùng có thể chọn. Đây có thể là một trong các chuỗi sau, hoặc danh sách của chúng để cho phép nhiều nguồn bề mặt:
    - `browser`
      - : Luồng chứa nội dung của một tab trình duyệt đơn lẻ mà người dùng đã chọn.
    - `monitor`
      - : Rãnh video trong luồng chứa toàn bộ nội dung của một hoặc nhiều màn hình của người dùng.
    - `window`
      - : Luồng chứa một cửa sổ đơn lẻ mà người dùng đã chọn để chia sẻ.

- {{domxref("MediaTrackConstraints.logicalSurface", "logicalSurface")}}
  - : Giá trị [`ConstrainBoolean`](#constrainboolean) có thể chứa một giá trị Boolean duy nhất hoặc tập hợp chúng, cho biết có cho phép người dùng chọn các bề mặt nguồn không tương ứng trực tiếp với các vùng hiển thị hay không. Chúng có thể bao gồm các bộ đệm hỗ trợ cho cửa sổ để cho phép chụp nội dung cửa sổ bị che khuất bởi các cửa sổ khác ở phía trước, hoặc các bộ đệm chứa các tài liệu lớn hơn cần cuộn để xem toàn bộ nội dung trong cửa sổ của chúng.

- {{domxref("MediaTrackConstraints.suppressLocalAudioPlayback", "suppressLocalAudioPlayback")}} {{Experimental_Inline}}
  - : Giá trị [`ConstrainBoolean`](#constrainboolean) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.suppressLocalAudioPlayback","suppressLocalAudioPlayback")}}. Thuộc tính này kiểm soát xem âm thanh đang phát trong một tab có tiếp tục được phát ra loa cục bộ của người dùng hay không khi tab đó được chụp.

- {{domxref("MediaTrackConstraints.restrictOwnAudio", "restrictOwnAudio")}} {{Experimental_Inline}}
  - : Giá trị [`ConstrainBoolean`](#constrainboolean) chỉ định các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.restrictOwnAudio","restrictOwnAudio")}}. Thuộc tính này kiểm soát xem âm thanh hệ thống xuất phát từ tab đang chụp có bị lọc bỏ khỏi chụp màn hình hay không.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- [API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API)
- [Sử dụng API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
- {{domxref("MediaStreamTrack.getConstraints()")}}
- {{domxref("MediaStreamTrack.applyConstraints()")}}
- {{domxref("MediaDevices.getUserMedia()")}}
- {{domxref("MediaDevices.getDisplayMedia()")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack.getSettings()")}}
