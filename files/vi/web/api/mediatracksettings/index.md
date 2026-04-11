---
title: MediaTrackSettings
slug: Web/API/MediaTrackSettings
page-type: web-api-interface
spec-urls:
  - https://w3c.github.io/mediacapture-main/#media-track-settings
  - https://w3c.github.io/mediacapture-screen-share/#extensions-to-mediatracksettings
---

{{APIRef("Media Capture and Streams")}}

Từ điển **`MediaTrackSettings`** được dùng để trả về các giá trị hiện tại được cấu hình cho từng thiết lập của {{domxref("MediaStreamTrack")}}. Các giá trị này sẽ tuân thủ càng sát càng tốt với mọi ràng buộc đã được mô tả trước đó bằng đối tượng {{domxref("MediaTrackConstraints")}} và thiết lập thông qua {{domxref("MediaStreamTrack.applyConstraints", "applyConstraints()")}}, đồng thời sẽ tuân thủ các ràng buộc mặc định cho những thuộc tính mà ràng buộc chưa được thay đổi hoặc không thể khớp.

Để tìm hiểu thêm về cách ràng buộc và thiết lập hoạt động, xem [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints).

## Thuộc tính phiên bản

Một số hoặc tất cả các thuộc tính sau đây sẽ có trong đối tượng, tùy thuộc vào việc trình duyệt có hỗ trợ hay không hoặc do bối cảnh sử dụng. Ví dụ, vì {{Glossary("RTP")}} không cung cấp một số giá trị trong quá trình thương lượng kết nối WebRTC, một rãnh liên kết với {{domxref("RTCPeerConnection")}} sẽ không bao gồm các giá trị như {{domxref("MediaTrackSettings.facingMode", "facingMode")}} hay {{domxref("MediaTrackSettings.groupId", "groupId")}}.

### Thuộc tính phiên bản của tất cả rãnh phương tiện

- {{domxref("MediaTrackSettings.deviceId", "deviceId")}}
  - : Một chuỗi cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.deviceId", "deviceId")}}. ID thiết bị là chuỗi định danh duy nhất theo nguồn gốc (origin-unique) xác định nguồn của rãnh; thường là một [GUID](https://en.wikipedia.org/wiki/Universally_unique_identifier). Giá trị này đặc thù cho nguồn dữ liệu của rãnh và không thể dùng để thiết lập ràng buộc; tuy nhiên, có thể dùng để chọn phương tiện ban đầu khi gọi {{domxref("MediaDevices.getUserMedia()")}}.
- {{domxref("MediaTrackSettings.groupId", "groupId")}}
  - : Một chuỗi cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.groupId", "groupId")}}. ID nhóm là chuỗi duy nhất trong phiên duyệt web (browsing session) xác định nhóm nguồn của rãnh. Hai thiết bị (được xác định bởi {{domxref("MediaTrackSettings.deviceId", "deviceId")}}) được coi là thuộc cùng một nhóm nếu chúng cùng từ một thiết bị vật lý. Ví dụ, thiết bị đầu vào và đầu ra âm thanh của loa và micro tích hợp trên điện thoại sẽ có cùng ID nhóm vì chúng là một phần của cùng thiết bị vật lý. Micro trên tai nghe sẽ có ID khác. Giá trị này đặc thù cho nguồn dữ liệu của rãnh và không thể dùng để thiết lập ràng buộc; tuy nhiên, có thể dùng để chọn phương tiện ban đầu khi gọi {{domxref("MediaDevices.getUserMedia()")}}.

### Thuộc tính phiên bản của rãnh âm thanh

- {{domxref("MediaTrackSettings.autoGainControl", "autoGainControl")}}
  - : Giá trị Boolean cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.autoGainControl", "autoGainControl")}}, là `true` nếu kiểm soát độ khuếch đại tự động được bật và là `false` nếu không.
- {{domxref("MediaTrackSettings.channelCount", "channelCount")}}
  - : Giá trị số nguyên dài cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.channelCount", "channelCount")}}, cho biết số kênh âm thanh có trong rãnh (và do đó cho biết có bao nhiêu mẫu âm thanh trong mỗi khung âm thanh). Giá trị này là 1 cho âm thanh mono, 2 cho âm thanh stereo, v.v.
- {{domxref("MediaTrackSettings.echoCancellation", "echoCancellation")}}
  - : Giá trị Boolean cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.echoCancellation", "echoCancellation")}}, là `true` nếu khử tiếng vọng được bật, ngược lại là `false`.
- {{domxref("MediaTrackSettings.latency", "latency")}}
  - : Số thực dấu phẩy động độ chính xác kép cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.latency", "latency")}}, cho biết độ trễ âm thanh tính bằng giây. Độ trễ là khoảng thời gian trôi qua từ lúc bắt đầu xử lý âm thanh đến khi dữ liệu sẵn sàng cho bước tiếp theo trong quá trình sử dụng âm thanh. Giá trị này là giá trị mục tiêu; độ trễ thực tế có thể dao động vì nhiều lý do.
- {{domxref("MediaTrackSettings.noiseSuppression", "noiseSuppression")}}
  - : Giá trị Boolean cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.noiseSuppression", "noiseSuppression")}}: `true` nếu triệt tiếng ồn được bật, và là `false` nếu không.
- {{domxref("MediaTrackSettings.restrictOwnAudio", "restrictOwnAudio")}}
  - : Giá trị Boolean cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.restrictOwnAudio", "restrictOwnAudio")}}: `true` nếu trình duyệt sẽ cố gắng lọc bỏ âm thanh hệ thống xuất phát từ tab đang chụp màn hình, và `false` nếu không.
- {{domxref("MediaTrackSettings.sampleRate", "sampleRate")}}
  - : Giá trị số nguyên dài cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.sampleRate", "sampleRate")}}, cho biết tốc độ lấy mẫu tính bằng mẫu mỗi giây của dữ liệu âm thanh. Ví dụ, âm thanh CD chất lượng tiêu chuẩn có tốc độ lấy mẫu là 41.000 mẫu mỗi giây.
- {{domxref("MediaTrackSettings.sampleSize", "sampleSize")}}
  - : Giá trị số nguyên dài cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.sampleSize", "sampleSize")}}, cho biết kích thước tuyến tính tính bằng bit của mỗi mẫu âm thanh. Ví dụ, âm thanh CD chất lượng có độ phân giải 16 bit, vì vậy giá trị này sẽ là 16.
- {{domxref("MediaTrackSettings.suppressLocalAudioPlayback", "suppressLocalAudioPlayback")}}
  - : Kiểm soát xem âm thanh đang phát trong một tab có tiếp tục được phát ra loa cục bộ của người dùng hay không khi tab đó được chụp.
- {{domxref("MediaTrackSettings.volume", "volume")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Số thực dấu phẩy động độ chính xác kép cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.volume", "volume")}}, cho biết mức âm lượng của rãnh. Giá trị này nằm trong khoảng 0.0 (im lặng) đến 1.0 (âm lượng tối đa được hỗ trợ).

### Thuộc tính phiên bản của rãnh video

- {{domxref("MediaTrackSettings.aspectRatio", "aspectRatio")}}
  - : Số thực dấu phẩy động độ chính xác kép cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.aspectRatio", "aspectRatio")}}, được chỉ định chính xác đến 10 chữ số thập phân. Đây là chiều rộng của hình ảnh tính bằng pixel chia cho chiều cao tính bằng pixel. Các giá trị thông thường bao gồm 1.3333333333 (cho {{glossary("aspect ratio")}} 4:3 truyền thống của TV), 1.7777777778 (cho tỷ lệ màn ảnh rộng 16:9 HD), và 1.6 (cho tỷ lệ 16:10 phổ biến trên máy tính và máy tính bảng màn ảnh rộng).
- {{domxref("MediaTrackSettings.facingMode", "facingMode")}}
  - : Chuỗi cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.facingMode", "facingMode")}}, cho biết hướng của camera. Giá trị sẽ là một trong các giá trị sau:
    - `"user"`
      - : Camera hướng về phía người dùng (thường gọi là "camera selfie"), dùng để tự chụp chân dung và gọi video.
    - `"environment"`
      - : Camera hướng ra xa người dùng (khi người dùng nhìn vào màn hình). Đây thường là camera chất lượng cao nhất trên thiết bị, dùng để chụp ảnh thông thường.
    - `"left"`
      - : Camera hướng về môi trường phía bên trái của người dùng.
    - `"right"`
      - : Camera hướng về môi trường phía bên phải của người dùng.

- {{domxref("MediaTrackSettings.frameRate", "frameRate")}}
  - : Số thực dấu phẩy động độ chính xác kép cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.frameRate", "frameRate")}}, cho biết có bao nhiêu khung hình video mỗi giây mà rãnh bao gồm. Nếu không thể xác định giá trị vì bất kỳ lý do gì, giá trị sẽ khớp với tốc độ đồng bộ dọc của thiết bị mà user agent đang chạy.
- {{domxref("MediaTrackSettings.height", "height")}}
  - : Giá trị số nguyên dài cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.height", "height")}}, cho biết chiều cao tính bằng pixel của dữ liệu video trong rãnh.
- {{domxref("MediaTrackSettings.width", "width")}}
  - : Giá trị số nguyên dài cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackSettings.width", "width")}}, cho biết chiều rộng tính bằng pixel của dữ liệu video trong rãnh.
- {{domxref("MediaTrackSettings.resizeMode", "resizeMode")}}
  - : Chuỗi cho biết giá trị hiện tại của thuộc tính {{domxref("MediaTrackConstraints.resizeMode", "resizeMode")}}, cho biết chế độ mà user agent dùng để lấy độ phân giải của rãnh. Giá trị sẽ là một trong các giá trị sau:
    - `"none"`
      - : Rãnh có độ phân giải do camera, driver hoặc hệ điều hành cung cấp.
    - `"crop-and-scale"`
      - : Độ phân giải của rãnh có thể là kết quả của việc user agent dùng cắt xén hoặc thu nhỏ từ độ phân giải camera cao hơn.

### Thuộc tính phiên bản của rãnh chia sẻ màn hình

Các rãnh chứa video chia sẻ từ màn hình của người dùng (bất kể dữ liệu màn hình đến từ toàn bộ màn hình hay một phần màn hình như cửa sổ hoặc tab) thường được xử lý như rãnh video, ngoại trừ chúng cũng hỗ trợ các thiết lập bổ sung sau:

- {{domxref("MediaTrackSettings.cursor", "cursor")}}
  - : Chuỗi cho biết con trỏ chuột có được đưa vào luồng được tạo ra hay không và trong điều kiện nào. Các giá trị có thể là:
    - `always`
      - : Con trỏ chuột luôn hiển thị trong nội dung video của {domxref("MediaStream"), trừ khi con trỏ chuột đã di chuyển ra ngoài vùng nội dung.
    - `motion`
      - : Con trỏ chuột luôn được đưa vào video nếu nó đang di chuyển, và trong một khoảng thời gian ngắn sau khi dừng di chuyển.
    - `never`
      - : Con trỏ chuột không bao giờ được đưa vào video chia sẻ.

- {{domxref("MediaTrackSettings.displaySurface", "displaySurface")}}
  - : Chuỗi cho biết loại nguồn mà rãnh chứa; một trong các giá trị:
    - `browser`
      - : Luồng chứa nội dung của một tab trình duyệt đơn lẻ mà người dùng đã chọn.
    - `monitor`
      - : Rãnh video trong luồng chứa toàn bộ nội dung của một hoặc nhiều màn hình của người dùng.
    - `window`
      - : Luồng chứa một cửa sổ đơn lẻ mà người dùng đã chọn để chia sẻ.

- {{domxref("MediaTrackSettings.logicalSurface", "logicalSurface")}}
  - : Giá trị Boolean, nếu là `true`, cho biết video trong rãnh video của luồng chứa một bối cảnh kết xuất nền (background rendering context), thay vì một bối cảnh hiển thị cho người dùng. Giá trị là `false` nếu video đang được chụp đến từ nguồn hiển thị ở tiền cảnh (hiển thị cho người dùng).

- {{domxref("MediaTrackSettings.screenPixelRatio", "screenPixelRatio")}}
  - : Số đại diện cho tỷ lệ kích thước vật lý của một pixel trên bề mặt hiển thị được chụp (hiển thị ở độ phân giải vật lý) so với kích thước logic của một pixel CSS trên màn hình chụp (hiển thị ở độ phân giải logic). Không thể dùng làm ràng buộc hoặc khả năng.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{domxref("MediaDevices.getUserMedia()")}}
- {{domxref("MediaDevices.getDisplayMedia()")}}
- {{domxref("MediaStreamTrack.getConstraints()")}}
- {{domxref("MediaStreamTrack.applyConstraints()")}}
- {{domxref("MediaStreamTrack.getSettings()")}}
