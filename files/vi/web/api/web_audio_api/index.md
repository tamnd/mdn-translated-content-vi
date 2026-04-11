---
title: Web Audio API
slug: Web/API/Web_Audio_API
page-type: web-api-overview
browser-compat: api.AudioContext
---

{{DefaultAPISidebar("Web Audio API")}}

Web Audio API cung cấp một hệ thống mạnh mẽ và linh hoạt để điều khiển âm thanh trên web, cho phép nhà phát triển chọn nguồn âm thanh, thêm hiệu ứng vào âm thanh, tạo trực quan hóa âm thanh, áp dụng hiệu ứng không gian (như cân bằng trái/phải) và nhiều hơn nữa.

## Khái niệm và cách dùng Web Audio

Web Audio API xử lý các thao tác âm thanh bên trong một **audio context**, và được thiết kế để hỗ trợ **định tuyến mô-đun**. Các thao tác âm thanh cơ bản được thực hiện bằng **audio node**, rồi được liên kết với nhau để tạo thành một **audio routing graph**. Nhiều nguồn khác nhau - với các kiểu bố trí kênh khác nhau - đều được hỗ trợ ngay cả trong cùng một context. Thiết kế mô-đun này mang lại sự linh hoạt để tạo ra các chức năng âm thanh phức tạp với hiệu ứng động.

Các audio node được nối thành chuỗi và các mạng đơn giản thông qua đầu vào và đầu ra của chúng. Chúng thường bắt đầu với một hoặc nhiều nguồn. Nguồn cung cấp các mảng cường độ âm thanh (mẫu) theo những lát thời gian rất nhỏ, thường là hàng chục nghìn mẫu mỗi giây. Chúng có thể được tính toán bằng toán học (như {{domxref("OscillatorNode")}}), hoặc là bản ghi từ tệp âm thanh/video (như {{domxref("AudioBufferSourceNode")}} và {{domxref("MediaElementAudioSourceNode")}}) và luồng âm thanh ({{domxref("MediaStreamAudioSourceNode")}}). Thực ra, tệp âm thanh chỉ là các bản ghi cường độ âm thanh được thu từ micro hoặc nhạc cụ điện tử, rồi được trộn xuống thành một sóng phức tạp duy nhất.

Đầu ra của các node này có thể được nối vào đầu vào của node khác, từ đó trộn hoặc biến đổi các luồng mẫu âm thanh thành các luồng khác. Một phép biến đổi phổ biến là nhân các mẫu với một giá trị để làm âm thanh to hơn hoặc nhỏ hơn, như trường hợp của {{domxref("GainNode")}}. Khi âm thanh đã được xử lý đủ cho hiệu ứng mong muốn, nó có thể được nối vào đầu vào của một đích đến ({{domxref("BaseAudioContext.destination")}}), nơi gửi âm thanh ra loa hoặc tai nghe. Kết nối cuối này chỉ cần thiết nếu người dùng thực sự cần nghe âm thanh.

Một quy trình làm việc đơn giản, điển hình cho web audio sẽ như sau:

1. Tạo audio context
2. Trong context, tạo nguồn - như `<audio>`, oscillator, stream
3. Tạo các node hiệu ứng, như reverb, biquad filter, panner, compressor
4. Chọn đích đến cuối của âm thanh, ví dụ loa hệ thống
5. Nối các nguồn vào hiệu ứng, và nối hiệu ứng vào đích đến.

![A simple box diagram with an outer box labeled Audio context, and three inner boxes labeled Sources, Effects and Destination. The three inner boxes have arrows between them pointing from left to right, indicating the flow of audio information.](audio-context_.png)

Việc định thời được kiểm soát với độ chính xác cao và độ trễ thấp, cho phép nhà phát triển viết mã phản hồi chính xác với sự kiện và nhắm đến các mẫu cụ thể, ngay cả ở tốc độ lấy mẫu cao. Vì vậy, các ứng dụng như máy trống và sequencer hoàn toàn nằm trong tầm tay.

Web Audio API cũng cho phép chúng ta điều khiển cách âm thanh được _không gian hóa_. Dùng hệ thống dựa trên _mô hình nguồn-người nghe_, nó cho phép điều khiển _mô hình pan_ và xử lý _suy giảm theo khoảng cách_ do nguồn di chuyển (hoặc người nghe di chuyển) gây ra.

> [!NOTE]
> Bạn có thể đọc thêm về lý thuyết của Web Audio API trong bài viết [Basic concepts behind Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API).

## Đối tượng sử dụng Web Audio API

Web Audio API có thể gây choáng ngợp với những ai không quen với thuật ngữ âm thanh hay âm nhạc, và vì nó bao gồm rất nhiều chức năng nên có thể khó bắt đầu nếu bạn là nhà phát triển.

Nó có thể được dùng để tích hợp âm thanh vào website hoặc ứng dụng của bạn, bằng cách [tạo không khí như futurelibrary.no](https://www.futurelibrary.no/), hoặc [phản hồi âm thanh trên biểu mẫu](https://css-tricks.com/form-validation-web-audio/). Tuy nhiên, nó cũng có thể dùng để tạo ra các nhạc cụ tương tác _nâng cao_. Vì thế, nó phù hợp cho cả nhà phát triển lẫn nhạc sĩ.

Chúng tôi có một [hướng dẫn nhập môn đơn giản](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API) dành cho những ai đã quen lập trình nhưng cần phần giới thiệu tốt về một số thuật ngữ và cấu trúc của API.

Cũng có bài [Basic Concepts Behind Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API) để giúp bạn hiểu cách âm thanh số hoạt động, đặc biệt trong phạm vi của API này. Bài đó cũng giới thiệu tốt về một số khái niệm nền tảng của API.

Học lập trình giống như chơi bài - bạn học luật, rồi bạn chơi, rồi bạn quay lại học luật tiếp, rồi lại chơi. Vì vậy nếu một phần lý thuyết chưa thật sự khớp sau bài hướng dẫn và bài viết đầu tiên, còn có [hướng dẫn nâng cao](/en-US/docs/Web/API/Web_Audio_API/Advanced_techniques) mở rộng từ bài đầu để giúp bạn thực hành những gì đã học và áp dụng thêm các kỹ thuật nâng cao để xây dựng một step sequencer.

Chúng tôi cũng có thêm các hướng dẫn và tài liệu tham khảo đầy đủ bao quát mọi tính năng của API. Xem thanh bên của trang này để biết thêm.

Nếu bạn quen hơn với khía cạnh âm nhạc, quen với các khái niệm lý thuyết âm nhạc, muốn bắt đầu xây dựng nhạc cụ, thì bạn có thể đi thẳng vào hướng dẫn nâng cao và các tài liệu khác làm kim chỉ nam (bài hướng dẫn được liên kết ở trên bao gồm lên lịch nốt nhạc, tạo oscillator và envelope tùy biến, cũng như LFO, cùng nhiều thứ khác.)

Nếu bạn chưa quen với kiến thức lập trình cơ bản, bạn nên xem trước một vài hướng dẫn JavaScript cho người mới bắt đầu rồi quay lại đây - xem [Beginner's JavaScript learning module](/en-US/docs/Learn_web_development/Core/Scripting) là nơi rất tốt để khởi đầu.

## Các giao diện của Web Audio API

Web Audio API có nhiều giao diện và sự kiện liên quan, được chia thành chín nhóm chức năng.

### Định nghĩa đồ thị âm thanh tổng quát

Các vùng chứa và định nghĩa tổng quát định hình đồ thị âm thanh trong cách dùng Web Audio API.

- {{domxref("AudioContext")}}
  - : Giao diện **`AudioContext`** đại diện cho một đồ thị xử lý âm thanh được tạo từ các mô-đun âm thanh liên kết với nhau, mỗi mô-đun được đại diện bởi một {{domxref("AudioNode")}}. Một audio context điều khiển việc tạo các node mà nó chứa và việc thực thi quá trình xử lý hoặc giải mã âm thanh. Bạn cần tạo `AudioContext` trước khi làm bất cứ điều gì khác, vì mọi thứ đều diễn ra bên trong một context.
- {{domxref("AudioNode")}}
  - : Giao diện **`AudioNode`** đại diện cho một mô-đun xử lý âm thanh như một _nguồn âm thanh_ (ví dụ một phần tử HTML {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}), _đích âm thanh_, hoặc _mô-đun xử lý trung gian_ (ví dụ bộ lọc như {{domxref("BiquadFilterNode")}}, hay _điều khiển âm lượng_ như {{domxref("GainNode")}}).
- {{domxref("AudioParam")}}
  - : Giao diện **`AudioParam`** đại diện cho một tham số liên quan đến âm thanh, như một tham số của {{domxref("AudioNode")}}. Nó có thể được đặt thành một giá trị cụ thể hoặc một thay đổi giá trị, và có thể được lập lịch để xảy ra tại một thời điểm cụ thể theo một mẫu cụ thể.
- {{domxref("AudioParamMap")}}
  - : Cung cấp một giao diện giống map cho một nhóm giao diện {{domxref("AudioParam")}}, nghĩa là nó cung cấp các phương thức `forEach()`, `get()`, `has()`, `keys()`, và `values()`, cùng với thuộc tính `size`.
- {{domxref("BaseAudioContext")}}
  - : Giao diện **`BaseAudioContext`** đóng vai trò là định nghĩa cơ sở cho các đồ thị xử lý âm thanh trực tuyến và ngoại tuyến, lần lượt được đại diện bởi {{domxref("AudioContext")}} và {{domxref("OfflineAudioContext")}}. Bạn sẽ không dùng trực tiếp `BaseAudioContext` - thay vào đó, bạn dùng các tính năng của nó thông qua một trong hai giao diện kế thừa này.
- Sự kiện {{domxref("AudioScheduledSourceNode/ended_event", "ended")}}
  - : Sự kiện `ended` được phát khi phát lại dừng vì đã chạm đến phần cuối của media.

### Định nghĩa nguồn âm thanh

Các giao diện định nghĩa nguồn âm thanh dùng trong Web Audio API.

- {{domxref("AudioScheduledSourceNode")}}
  - : **`AudioScheduledSourceNode`** là giao diện cha cho một số loại giao diện node nguồn âm thanh. Nó là một {{domxref("AudioNode")}}.
- {{domxref("OscillatorNode")}}
  - : Giao diện **`OscillatorNode`** đại diện cho một dạng sóng tuần hoàn, chẳng hạn sóng sin hoặc sóng tam giác. Nó là một mô-đun xử lý âm thanh {{domxref("AudioNode")}} tạo ra một _tần số_ sóng nhất định.
- {{domxref("AudioBuffer")}}
  - : Giao diện **`AudioBuffer`** đại diện cho một tài sản âm thanh ngắn nằm trong bộ nhớ, được tạo từ tệp âm thanh bằng phương thức {{ domxref("BaseAudioContext.decodeAudioData") }}, hoặc được tạo với dữ liệu thô bằng {{ domxref("BaseAudioContext.createBuffer") }}. Sau khi được giải mã theo dạng này, âm thanh có thể được đưa vào một {{ domxref("AudioBufferSourceNode") }}.
- {{domxref("AudioBufferSourceNode")}}
  - : Giao diện **`AudioBufferSourceNode`** đại diện cho một nguồn âm thanh gồm dữ liệu âm thanh trong bộ nhớ, được lưu trong một {{domxref("AudioBuffer")}}. Nó là một {{domxref("AudioNode")}} hoạt động như một nguồn âm thanh.
- {{domxref("MediaElementAudioSourceNode")}}
  - : Giao diện **`MediaElementAudioSourceNode`** đại diện cho một nguồn âm thanh gồm phần tử HTML {{ htmlelement("audio") }} hoặc {{ htmlelement("video") }}. Nó là một {{domxref("AudioNode")}} hoạt động như một nguồn âm thanh.
- {{domxref("MediaStreamAudioSourceNode")}}
  - : Giao diện **`MediaStreamAudioSourceNode`** đại diện cho một nguồn âm thanh gồm một {{domxref("MediaStream")}} (như webcam, microphone, hoặc một luồng được gửi từ máy tính từ xa). Nếu stream có nhiều audio track, track có {{domxref("MediaStreamTrack.id", "id")}} đứng đầu theo thứ tự từ điển (theo bảng chữ cái) sẽ được dùng. Nó là một {{domxref("AudioNode")}} hoạt động như một nguồn âm thanh.
- {{domxref("MediaStreamTrackAudioSourceNode")}}
  - : Một node kiểu {{domxref("MediaStreamTrackAudioSourceNode")}} đại diện cho một nguồn âm thanh có dữ liệu đến từ một {{domxref("MediaStreamTrack")}}. Khi tạo node bằng phương thức {{domxref("AudioContext.createMediaStreamTrackSource", "createMediaStreamTrackSource()")}} để tạo node, bạn chỉ định track nào sẽ được dùng. Điều này cho bạn nhiều quyền kiểm soát hơn `MediaStreamAudioSourceNode`.

### Định nghĩa bộ lọc hiệu ứng âm thanh

Các giao diện để định nghĩa hiệu ứng mà bạn muốn áp dụng cho nguồn âm thanh của mình.

- {{domxref("BiquadFilterNode")}}
  - : Giao diện **`BiquadFilterNode`** đại diện cho một bộ lọc bậc thấp đơn giản. Nó là một {{domxref("AudioNode")}} có thể đại diện cho nhiều kiểu bộ lọc khác nhau, thiết bị điều khiển âm sắc hoặc bộ cân bằng đồ họa. `BiquadFilterNode` luôn có đúng một đầu vào và một đầu ra.
- {{domxref("ConvolverNode")}}
  - : Giao diện **`ConvolverNode`** là một {{domxref("AudioNode")}} thực hiện phép tích chập tuyến tính trên một {{domxref("AudioBuffer")}} nhất định, và thường được dùng để tạo hiệu ứng reverb.
- {{domxref("DelayNode")}}
  - : Giao diện **`DelayNode`** đại diện cho một [delay-line](https://en.wikipedia.org/wiki/Digital_delay_line); một mô-đun xử lý âm thanh {{domxref("AudioNode")}} tạo ra độ trễ giữa lúc dữ liệu đầu vào đến và lúc nó được truyền ra đầu ra.
- {{domxref("DynamicsCompressorNode")}}
  - : Giao diện **`DynamicsCompressorNode`** cung cấp hiệu ứng nén, giúp giảm âm lượng ở những phần to nhất của tín hiệu để hạn chế clipping và méo âm có thể xảy ra khi nhiều âm thanh được phát và ghép cùng lúc.
- {{domxref("GainNode")}}
  - : Giao diện **`GainNode`** đại diện cho sự thay đổi âm lượng. Nó là một mô-đun xử lý âm thanh {{domxref("AudioNode")}} tạo ra một _gain_ nhất định được áp dụng lên dữ liệu đầu vào trước khi truyền ra đầu ra.
- {{domxref("WaveShaperNode")}}
  - : Giao diện **`WaveShaperNode`** đại diện cho một bộ méo phi tuyến. Nó là một {{domxref("AudioNode")}} dùng một đường cong để áp dụng méo sóng lên tín hiệu. Ngoài các hiệu ứng méo rõ ràng, nó thường được dùng để làm tín hiệu nghe ấm hơn.
- {{domxref("PeriodicWave")}}
  - : Mô tả một dạng sóng tuần hoàn có thể dùng để định hình đầu ra của {{ domxref("OscillatorNode") }}.
- {{domxref("IIRFilterNode")}}
  - : Triển khai một bộ lọc [đáp ứng xung vô hạn](https://en.wikipedia.org/wiki/Infinite_impulse_response) (IIR) tổng quát; kiểu bộ lọc này cũng có thể được dùng để triển khai các thiết bị điều khiển âm sắc và bộ cân bằng đồ họa.

### Định nghĩa đích âm thanh

Khi bạn xử lý xong âm thanh, các giao diện này xác định nơi để xuất âm thanh.

- {{domxref("AudioDestinationNode")}}
  - : Giao diện **`AudioDestinationNode`** đại diện cho đích cuối của một nguồn âm thanh trong một context nhất định - thường là loa của thiết bị.
- {{domxref("MediaStreamAudioDestinationNode")}}
  - : Giao diện **`MediaStreamAudioDestinationNode`** đại diện cho một đích âm thanh gồm một [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("MediaStream")}} với một `AudioMediaStreamTrack` duy nhất, có thể dùng theo cách tương tự như một {{domxref("MediaStream")}} nhận được từ {{ domxref("MediaDevices.getUserMedia", "getUserMedia()") }}. Nó là một {{domxref("AudioNode")}} hoạt động như một đích âm thanh.

### Phân tích và trực quan hóa dữ liệu

Nếu bạn muốn trích xuất dữ liệu thời gian, tần số và dữ liệu khác từ âm thanh, `AnalyserNode` là thứ bạn cần.

- {{domxref("AnalyserNode")}}
  - : Giao diện **`AnalyserNode`** đại diện cho một node có thể cung cấp thông tin phân tích theo thời gian thực ở miền tần số và miền thời gian, phục vụ cho phân tích dữ liệu và trực quan hóa.

### Tách và gộp kênh âm thanh

Để tách và gộp các kênh âm thanh, bạn sẽ dùng các giao diện này.

- {{domxref("ChannelSplitterNode")}}
  - : Giao diện **`ChannelSplitterNode`** tách các kênh khác nhau của một nguồn âm thanh ra thành một tập hợp đầu ra _mono_.
- {{domxref("ChannelMergerNode")}}
  - : Giao diện **`ChannelMergerNode`** hợp nhất nhiều đầu vào mono thành một đầu ra duy nhất. Mỗi đầu vào sẽ được dùng để điền vào một kênh của đầu ra.

### Không gian hóa âm thanh

Các giao diện này cho phép bạn thêm hiệu ứng pan không gian hóa âm thanh vào nguồn âm thanh của mình.

- {{domxref("AudioListener")}}
  - : Giao diện **`AudioListener`** đại diện cho vị trí và hướng của người đang nghe cảnh âm thanh được dùng trong không gian hóa âm thanh.
- {{domxref("PannerNode")}}
  - : Giao diện **`PannerNode`** đại diện cho vị trí và hành vi của tín hiệu nguồn âm thanh trong không gian 3D, cho phép bạn tạo các hiệu ứng pan phức tạp.
- {{domxref("StereoPannerNode")}}
  - : Giao diện **`StereoPannerNode`** đại diện cho một node pan stereo đơn giản có thể dùng để pan luồng âm thanh sang trái hoặc phải.

### Xử lý âm thanh bằng JavaScript

Với audio worklet, bạn có thể định nghĩa các node âm thanh tùy chỉnh viết bằng JavaScript hoặc [WebAssembly](/en-US/docs/WebAssembly). Audio worklet triển khai giao diện {{domxref("Worklet")}}, một phiên bản nhẹ của giao diện {{domxref("Worker")}}.

- {{domxref("AudioWorklet")}}
  - : Giao diện `AudioWorklet` có sẵn thông qua {{domxref("AudioContext")}} object's {{domxref("BaseAudioContext.audioWorklet", "audioWorklet")}}, và cho phép bạn thêm các mô-đun vào audio worklet để chạy ngoài luồng chính.
- {{domxref("AudioWorkletNode")}}
  - : Giao diện `AudioWorkletNode` đại diện cho một {{domxref("AudioNode")}} được nhúng vào một audio graph và có thể gửi thông điệp đến `AudioWorkletProcessor` tương ứng.
- {{domxref("AudioWorkletProcessor")}}
  - : Giao diện `AudioWorkletProcessor` đại diện cho mã xử lý âm thanh chạy trong `AudioWorkletGlobalScope` để tạo, xử lý hoặc phân tích âm thanh trực tiếp, và có thể gửi thông điệp đến `AudioWorkletNode` tương ứng.
- {{domxref("AudioWorkletGlobalScope")}}
  - : Giao diện `AudioWorkletGlobalScope` là một đối tượng dẫn xuất từ `WorkletGlobalScope` đại diện cho ngữ cảnh worker trong đó một script xử lý âm thanh được chạy; nó được thiết kế để cho phép tạo, xử lý và phân tích dữ liệu âm thanh trực tiếp bằng JavaScript trong luồng worklet thay vì trên luồng chính.

#### Không còn dùng: script processor nodes

Trước khi audio worklet được định nghĩa, Web Audio API dùng `ScriptProcessorNode` cho xử lý âm thanh bằng JavaScript. Vì mã chạy trên luồng chính nên hiệu năng không tốt. `ScriptProcessorNode` vẫn được giữ lại vì lý do lịch sử nhưng đã được đánh dấu là không dùng nữa.

- {{domxref("ScriptProcessorNode")}} {{deprecated_inline}}
  - : Giao diện **`ScriptProcessorNode`** cho phép tạo, xử lý hoặc phân tích âm thanh bằng JavaScript. Nó là một mô-đun xử lý âm thanh {{domxref("AudioNode")}} được liên kết với hai buffer, một chứa đầu vào hiện tại, một chứa đầu ra. Một sự kiện, triển khai giao diện {{domxref("AudioProcessingEvent")}}, được gửi đến đối tượng mỗi khi buffer đầu vào chứa dữ liệu mới, và bộ xử lý sự kiện sẽ kết thúc khi nó đã lấp đầy buffer đầu ra bằng dữ liệu.
- {{domxref("ScriptProcessorNode.audioprocess_event", "audioprocess")}} (event) {{deprecated_inline}}
  - : Sự kiện `audioprocess` được phát khi một buffer đầu vào của Web Audio API {{domxref("ScriptProcessorNode")}} đã sẵn sàng để xử lý.
- {{domxref("AudioProcessingEvent")}} {{deprecated_inline}}
  - : `AudioProcessingEvent` đại diện cho các sự kiện xảy ra khi buffer đầu vào của {{domxref("ScriptProcessorNode")}} đã sẵn sàng để xử lý.

### Xử lý âm thanh ngoại tuyến/nền

Có thể xử lý/kết xuất một audio graph rất nhanh ở nền - kết xuất vào một {{domxref("AudioBuffer")}} thay vì ra loa của thiết bị - với các mục sau.

- {{domxref("OfflineAudioContext")}}
  - : Giao diện **`OfflineAudioContext`** là một giao diện {{domxref("AudioContext")}} đại diện cho một đồ thị xử lý âm thanh được xây dựng từ các {{domxref("AudioNode")}} liên kết với nhau. Khác với `AudioContext` chuẩn, `OfflineAudioContext` thực sự không kết xuất âm thanh mà thay vào đó là tạo ra nó, _nhanh nhất có thể_, trong một buffer.
- {{domxref("OfflineAudioContext/complete_event", "complete")}} (event)
  - : Sự kiện `complete` được phát khi việc kết xuất của một {{domxref("OfflineAudioContext")}} kết thúc.
- {{domxref("OfflineAudioCompletionEvent")}}
  - : `OfflineAudioCompletionEvent` đại diện cho các sự kiện xảy ra khi quá trình xử lý của một {{domxref("OfflineAudioContext")}} kết thúc. Sự kiện {{domxref("OfflineAudioContext/complete_event", "complete")}} dùng giao diện này.

## Hướng dẫn và bài học

{{SubpagesWithSummaries}}

## Ví dụ

Bạn có thể tìm thấy nhiều ví dụ tại repo [webaudio-examples](https://github.com/mdn/webaudio-examples/) của chúng tôi trên GitHub.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

### Hướng dẫn/bài học

- [Basic concepts behind Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API)
- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Advanced techniques: creating sound, sequencing, timing, scheduling](/en-US/docs/Web/API/Web_Audio_API/Advanced_techniques)
- [Autoplay guide for media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay)
- [Using IIR filters](/en-US/docs/Web/API/Web_Audio_API/Using_IIR_filters)
- [Visualizations with Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Visualizations_with_Web_Audio_API)
- [Web audio spatialization basics](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
- [Controlling multiple parameters with ConstantSourceNode](/en-US/docs/Web/API/Web_Audio_API/Controlling_multiple_parameters_with_ConstantSourceNode)
- [Mixing Positional Audio and WebGL (2012)](https://web.dev/articles/webaudio-positional-audio)
- [Developing Game Audio with the Web Audio API (2012)](https://web.dev/articles/webaudio-games)

### Thư viện

- [Tone.js](https://tonejs.github.io/): một framework để tạo âm nhạc tương tác trong trình duyệt.
