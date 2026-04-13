---
title: "XRReferenceSpace: sự kiện reset"
short-title: reset
slug: Web/API/XRReferenceSpace/reset_event
page-type: web-api-event
browser-compat: api.XRReferenceSpace.reset_event
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Sự kiện **`reset`** được gửi đến một đối tượng {{domxref("XRReferenceSpace")}} khi phát hiện ra sự gián đoạn trong gốc tọa độ gốc hoặc gốc tọa độ hiệu quả, gây ra sự nhảy trong vị trí hoặc hướng của các đối tượng được định hướng bằng không gian tham chiếu. Điều này phổ biến khi người dùng hiệu chỉnh hoặc hiệu chỉnh lại thiết bị XR, hoặc nếu thiết bị tự động thay đổi gốc tọa độ sau khi mất tín hiệu theo dõi của người dùng, rồi lấy lại.

Trong trường hợp các đối tượng {{domxref("XRBoundedReferenceSpace")}}, sự kiện `reset` cũng có thể được kích hoạt khi {{domxref("XRBoundedReferenceSpace.boundsGeometry", "boundsGeometry")}} thay đổi.

Trong cả hai trường hợp, sự kiện được gửi trước khi bất kỳ khung hoạt ảnh WebXR nào sử dụng gốc tọa độ mới được thực thi.

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("reset", (event) => { })

onreset = (event) => { }
```

## Loại sự kiện

Một {{domxref("XRReferenceSpaceEvent")}}. Kế thừa từ {{domxref("Event")}}.

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("XRReferenceSpaceEvent.referenceSpace", "referenceSpace")}} {{ReadOnlyInline}}
  - : Một {{domxref("XRReferenceSpace")}} chỉ ra không gian tham chiếu đã tạo ra sự kiện.
- {{domxref("XRReferenceSpaceEvent.transform", "transform")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRRigidTransform")}} chỉ ra vị trí và hướng của gốc tọa độ gốc của đối tượng `referenceSpace` đã chỉ định sau sự kiện, được định nghĩa so với hệ tọa độ trước sự kiện.

## Mô tả

Sự kiện `reset` cho biết hệ tọa độ đã được đặt lại hoặc cấu hình lại bằng cách thay đổi gốc tọa độ của không gian tham chiếu, di chuyển và xoay nó như được chỉ ra bởi thuộc tính {{domxref("XRReferenceSpaceEvent.transform", "transform")}} của sự kiện. Sự kiện được gửi trước khi bất kỳ callback khung hoạt ảnh nào được thực thi để kết xuất khung đang chờ, để đảm bảo rằng các callback đó có hệ tọa độ cập nhật.

Có một số lý do khiến việc đặt lại có thể xảy ra. Phổ biến nhất trong số chúng là:

- Người dùng đã đặt lại thủ công hệ tọa độ, chẳng hạn như bằng cách yêu cầu tai nghe hiệu chỉnh lại để đảm bảo hướng nhìn và tay cầm điều khiển được đồng bộ với vị trí và hướng thực tế của người dùng. Đây chủ yếu là vấn đề cho các không gian tham chiếu `local` hoặc `local-floor`.
- Đối với không gian tham chiếu `bounded-floor`, hệ tọa độ có thể được đặt lại nếu người dùng thoát khỏi ranh giới của không gian tham chiếu và vào một cái mới (chẳng hạn như đi qua từ một cấp độ này sang cấp độ khác trong trò chơi, trong đó mỗi cấp độ có bản đồ riêng với hệ tọa độ riêng).
- Hệ thống theo dõi đã tạm thời mất người dùng, sau đó tìm lại họ, nhưng không phải trước khi họ đã di chuyển đủ xa khỏi vị trí đã biết cuối cùng. Chủ yếu là vấn đề cho các không gian tham chiếu `unbounded`.
- Người dùng đang ở trong không gian tham chiếu `unbounded` và đã di chuyển đủ xa từ vị trí bắt đầu (gốc tọa độ của không gian tham chiếu) đến mức các lỗi dấu phẩy động hoặc các hình thức lỗi hoặc trôi dạt khác gây ra vấn đề. Hệ tọa độ do đó được đặt lại với gốc tọa độ mới tại hoặc gần vị trí hiện tại của người dùng.
- Cơ sở hạ tầng WebXR hoặc trình điều khiển phần cứng phát hiện rằng thiết bị đã tạm thời mất tín hiệu theo dõi, khiến phần cứng và phần mềm không đồng bộ về vị trí và hướng.

> [!NOTE]
> Sự kiện `reset` sẽ _không_ xảy ra nếu không gian tham chiếu có thể lấy lại tín hiệu theo dõi của gốc tọa độ trước đó của nó, vì điều đó có nghĩa là gốc tọa độ không bị buộc phải di chuyển. Sự kiện này chỉ được kích hoạt khi gốc tọa độ phải được di chuyển để phục hồi sau khi mất tín hiệu theo dõi.

### Đặt lại thủ công

Nếu bạn đã từng sử dụng tai nghe VR, bạn đã trải qua những lúc khởi động và mặc dù bạn đang nhìn thẳng về phía trước, tai nghe lại nghĩ bạn đang nhìn vào bầu trời hoặc sàn nhà; hoặc những lúc bạn chỉ tay cầm điều khiển thẳng về phía trước, nhưng nó lại nghĩ bạn đang chỉ lên trên và sang phải ở đâu đó. Khi điều đó xảy ra, bạn thường giữ một nút ở đâu đó và nó khiến thế giới đồng bộ lại với hướng hiện tại của thiết bị. Điều đó hoạt động bằng cách gửi sự kiện `reset` đến không gian tham chiếu hoặc các không gian tham chiếu dựa trên hướng của tai nghe.

### Xử lý sự gián đoạn

Bạn có thể xử lý các sự nhảy trong vị trí của người xem bằng cách theo dõi thuộc tính Boolean {{domxref("XRPose")}} {{domxref("XRPose.emulatedPosition", "emulatedPosition")}}. Nếu sự nhảy trong vị trí của người xem xảy ra đồng thời với việc `emulatedPosition` chuyển từ `true` sang `false`, người xem đã lấy lại tín hiệu theo dõi và vị trí mới của họ đại diện cho một sự điều chỉnh từ các giá trị đã được mô phỏng trước đó. Đây thường là hành vi mong muốn nếu trang web hoặc ứng dụng của bạn không mô phỏng chuyển động qua không gian bằng cách thay đổi rõ ràng vị trí và/hoặc hướng của người xem.

Tuy nhiên, nếu kiểu "dịch chuyển tức thời" đó đang được sử dụng, bạn thực sự muốn tránh làm nhảy vị trí người dùng sau khi phục hồi tín hiệu theo dõi, vì điều này có thể gây ra sự nhảy thêm và có khả năng gây khó chịu. Thay vì cho phép điều này xảy ra, bạn có thể tích hợp `emulatedPosition` vào độ lệch dịch chuyển tức thì được tính toán trước khi gọi {{domxref("XRReferenceSpace.getOffsetReferenceSpace", "getOffsetReferenceSpace()")}} để tạo một không gian tham chiếu mới có gốc tọa độ hiệu quả được cập nhật được điều chỉnh theo khoảng cách vị trí của người xem đã nhảy kể từ khung trước đó. Bằng cách này, vị trí của người dùng chỉ thay đổi một lần thay vì hai lần.

### Tác động của kích thước gián đoạn

Sự kiện `reset` sẽ không được kích hoạt khi sự gián đoạn đủ nhỏ để thiết bị có thể lấy lại tín hiệu theo dõi trong cùng một khu vực theo dõi. Nó cũng sẽ không được kích hoạt tại một không gian tham chiếu không giới hạn khi nó thực hiện các điều chỉnh nhỏ theo gốc tọa độ gốc theo thời gian để duy trì sự ổn định của không gian ở gần người dùng; chỉ các sự gián đoạn lớn mới kích hoạt việc đặt lại.

## Ví dụ

Để thêm một trình xử lý cho sự kiện `reset`, bạn có thể sử dụng một trong hai cách tiếp cận. Đầu tiên, bạn có thể sử dụng phương thức {{domxref("EventTarget.addEventListener", "addEventListener()")}}:

```js
viewerRefSpace.addEventListener("reset", (event) => {
  /* perform reset related tasks */
});
```

Cách thứ hai là đặt thuộc tính xử lý sự kiện `onreset` của đối tượng `XRReferenceSpace`:

```js
viewerRefSpace.onreset = (event) => {
  /* perform reset related tasks */
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
