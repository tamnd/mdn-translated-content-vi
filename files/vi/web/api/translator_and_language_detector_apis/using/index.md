---
title: Using the Translator and Language Detector APIs
slug: Web/API/Translator_and_Language_Detector_APIs/Using
page-type: guide
---

{{DefaultAPISidebar("Translator and Language Detector APIs")}}

[Translator and Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs) cung cấp các cơ chế bất đồng bộ (dựa trên {{jsxref("Promise")}}) để trang web phát hiện ngôn ngữ và dịch văn bản thông qua mô hình AI nội bộ của trình duyệt. Điều này hữu ích và hiệu quả vì trình duyệt xử lý dịch vụ, thay vì nhà phát triển phải dựa vào người dùng tải xuống các mô hình AI, hoặc lưu trữ hoặc trả tiền cho dịch vụ dịch thuật dựa trên đám mây. Bài viết này giải thích cách sử dụng các API này.

## Phát hiện ngôn ngữ

Tất cả chức năng phát hiện ngôn ngữ được truy cập qua giao diện {{domxref("LanguageDetector")}}.

Bước đầu tiên để mô hình AI phát hiện ngôn ngữ là tạo phiên bản đối tượng `LanguageDetector`. Điều này được thực hiện bằng phương thức tĩnh {{domxref("LanguageDetector.create_static", "LanguageDetector.create()")}}, nhận một đối tượng tùy chọn làm đối số:

```js
const detector = await LanguageDetector.create({
  expectedInputLanguages: ["en-US", "zh"],
});
```

Thuộc tính {{domxref("LanguageDetector.expectedInputLanguages", "expectedInputLanguages")}} chỉ định các ngôn ngữ bạn dự kiến đưa vào detector, để giúp cải thiện độ chính xác của việc phát hiện ngôn ngữ.

> [!NOTE]
> Các triển khai khác nhau có thể hỗ trợ các ngôn ngữ khác nhau.

Khi đã tạo phiên bản `LanguageDetector`, bạn có thể sử dụng nó để phát hiện ngôn ngữ bằng cách gọi phương thức phiên bản {{domxref("LanguageDetector.detect()")}} trên nó, truyền văn bản cần kiểm tra làm đối số.

```js
const results = await detector.detect(myTextString);
```

Phương thức này trả về một mảng các đối tượng đại diện cho các kết quả khớp ngôn ngữ được phát hiện tiềm năng. Mỗi kết quả chứa:

- Một chuỗi chứa {{glossary("BCP 47 language tag")}} đại diện cho ngôn ngữ được phát hiện.
- Một số từ 0 đến 1 đại diện cho điểm tin cậy cho kết quả khớp đó.

Ví dụ:

```js
results.forEach((result) => {
  console.log(`${result.detectedLanguage}: ${result.confidence}`);
});

// Kết quả:
// la: 0.8359838724136353
// es: 0.017705978825688362
// sv: 0.012977192178368568
// en: 0.011148443445563316
// und: 0.0003214875760022551
```

> [!NOTE]
> Phần tử mảng cuối cùng luôn đại diện cho điểm tin cậy cho ngôn ngữ `und` — đây là viết tắt của "undetermined" (không xác định), và đại diện cho xác suất văn bản không được viết bằng ngôn ngữ mà mô hình biết.

## Tạo bản dịch

Dịch thuật theo một mẫu rất giống với phát hiện ngôn ngữ. Phiên bản đối tượng {{domxref("Translator")}} được tạo bằng phương thức tĩnh {{domxref("Translator.create_static", "Translator.create()")}}, nhận đối tượng tùy chọn phải chứa ít nhất {{domxref("Translator.sourceLanguage", "sourceLanguage")}} và {{domxref("Translator.targetLanguage", "targetLanguage")}}:

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});
```

Bản dịch sau đó được tạo bằng cách gọi phương thức phiên bản {{domxref("Translator.translate()")}}, được truyền chuỗi văn bản cần dịch làm đối số:

```js
const translation = await translator.translate(myTextString);
```

Trả về một chuỗi chứa bản dịch.

Cũng có phiên bản streaming của phương thức `translate()`, {{domxref("Translator.translateStreaming()")}}, cho phép bạn trả về bản dịch dưới dạng {{domxref("ReadableStream")}}. Điều này có thể hữu ích khi dịch các đoạn văn bản rất lớn:

```js
const stream = translator.translateStreaming(myTextString);
let translation = "";

for await (const chunk of stream) {
  translation += chunk;
}

console.log("Stream complete");
console.log(translation);
```

## Kiểm tra hỗ trợ cấu hình

Trước khi tạo đối tượng `LanguageDetector` hoặc `Translator`, bạn có thể kiểm tra xem cấu hình ngôn ngữ mong muốn của mình có được hỗ trợ bởi trình duyệt hiện tại không bằng các phương thức tĩnh {{domxref("LanguageDetector.availability_static", "LanguageDetector.availability()")}} và {{domxref("Translator.availability_static", "Translator.availability()")}}. Ví dụ:

```js
const detectorAvailability = await LanguageDetector.availability({
  expectedInputLanguages: ["en-US", "ja"],
});

const translatorAvailability = await Translator.availability({
  sourceLanguage: "en",
  targetLanguage: "ja",
});
```

Các phương thức này trả về một giá trị liệt kê cho biết liệu hỗ trợ có hoặc sẽ có sẵn cho tập hợp tùy chọn được chỉ định:

- `downloadable` có nghĩa là triển khai hỗ trợ các tùy chọn được yêu cầu, nhưng cần tải xuống một mô hình hoặc một số dữ liệu tinh chỉnh.
- `downloading` có nghĩa là triển khai hỗ trợ các tùy chọn được yêu cầu, nhưng cần hoàn thành quá trình tải xuống đang diễn ra.
- `available` có nghĩa là triển khai hỗ trợ các tùy chọn được yêu cầu mà không cần bất kỳ lần tải xuống mới nào.
- `unavailable` có nghĩa là triển khai không hỗ trợ các tùy chọn được yêu cầu.

Nếu cần tải xuống, nó sẽ được trình duyệt bắt đầu tự động khi phiên bản `LanguageDetector` hoặc `Translator` được tạo bằng phương thức `create()` liên quan. Bạn có thể theo dõi tiến trình tải xuống tự động bằng [màn hình](#monitoring_download_progress).

## Hủy thao tác và hủy phiên bản

Bạn có thể hủy thao tác phát hiện hoặc dịch thuật đang chờ bằng {{domxref("AbortController")}}, với {{domxref("AbortSignal")}} liên quan được bao gồm bên trong đối tượng tùy chọn phương thức làm giá trị thuộc tính `signal`. Ví dụ, hủy thao tác `Translator.create()` sẽ trông như thế này:

```js
const controller = new AbortController();

const translator = await Translator.create({
  sourceLanguage: detectedLanguage,
  targetLanguage: formData.get("translateLanguage"),
  signal: controller.signal,
});

// ...

controller.abort();
```

Sau khi phiên bản `LanguageDetector` hoặc `Translator` được tạo, bạn có thể giải phóng tài nguyên được gán và dừng mọi hoạt động tiếp theo bằng cách gọi phương thức {{domxref("LanguageDetector.destroy()")}}/{{domxref("Translator.destroy()")}} của nó. Bạn được khuyến khích thực hiện điều này sau khi đã hoàn thành với đối tượng vì nó có thể tiêu thụ nhiều tài nguyên.

```js
translator.destroy();
detector.destroy();
```

Nếu lời gọi `create()` có `AbortController` liên quan, và bạn gọi phương thức {{domxref("AbortController.abort()")}} của nó sau khi lời gọi `create()` đã thành công, nó sẽ có tác dụng tương tự như gọi `destroy()` trên đối tượng `LanguageDetector` hoặc `Translator` kết quả.

## Theo dõi tiến trình tải xuống

Nếu mô hình AI cho một lần phát hiện hoặc dịch cụ thể đang tải xuống (`availability()` trả về `downloadable` và `downloading`), sẽ hữu ích khi cung cấp phản hồi cho người dùng để cho họ biết họ cần chờ bao lâu trước khi thao tác hoàn tất.

Các phương thức `create()` của `Translator` và `LanguageDetector` có thể chấp nhận thuộc tính `monitor`, giá trị là hàm gọi lại nhận phiên bản {{domxref("CreateMonitor")}} làm đối số. `CreateMonitor` có sự kiện {{domxref("CreateMonitor/downloadprogress_event", "downloadprogress")}} sẵn có, được kích hoạt khi có tiến trình tải xuống mô hình AI.

Bạn có thể sử dụng sự kiện này để hiển thị dữ liệu tiến trình tải xuống:

```js
translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
  monitor(monitor) {
    monitor.addEventListener("downloadprogress", (e) => {
      console.log(`Downloaded ${Math.floor(e.loaded * 100)}%`);
    });
  },
});
```

Nếu các ngôn ngữ được chỉ định không được hỗ trợ, quá trình tải xuống sẽ không được bắt đầu và `NotSupportedError` {{domxref("DOMException")}} sẽ được ném ra.

## Hạn ngạch sử dụng

Một số triển khai có hạn ngạch đầu vào kiểm soát số lượng thao tác mà trang web có thể yêu cầu trong một khoảng thời gian nhất định. Tổng hạn ngạch có thể truy cập thông qua thuộc tính {{domxref("Translator.inputQuota")}}/{{domxref("LanguageDetector.inputQuota")}}, trong khi sử dụng hạn ngạch cho một lần dịch hoặc phát hiện ngôn ngữ cụ thể có thể được trả về bằng các phương thức {{domxref("Translator.measureInputUsage()")}}/{{domxref("LanguageDetector.measureInputUsage()")}}:

Ví dụ, đoạn mã dưới đây trả về tổng hạn ngạch đầu vào qua `Translator.inputQuota` và sử dụng hạn ngạch đầu vào cho việc dịch một chuỗi văn bản cụ thể qua `Translator.measureInputUsage()`.

Sau đó chúng ta kiểm tra xem sử dụng đầu vào cho chuỗi đó có lớn hơn tổng hạn ngạch khả dụng không. Nếu có, chúng ta ném lỗi phù hợp; nếu không, chúng ta bắt đầu dịch chuỗi bằng {{domxref("Translator.translate", "translate()")}}.

```js
const translator = await Translator.create({
  sourceLanguage: "en",
  targetLanguage: "ja",
});

const totalInputQuota = translator.inputQuota;
const inputUsage = await translator.measureInputUsage(myTextString);

if (inputUsage > totalInputQuota) {
  throw new Error("Insufficient quota to translate.");
} else {
  console.log("Quota available to translate.");
  const translation = await translator.translate(myTextString);
  // ...
}
```

Nếu bạn cố gắng chạy thao tác phát hiện ngôn ngữ hoặc dịch thuật vượt quá hạn ngạch khả dụng, `QuotaExceededError` {{domxref("DOMException")}} sẽ được ném ra.

## Ví dụ đầy đủ

Hãy xem một ví dụ đầy đủ minh họa Translator and Language Detector APIs trong thực tế.

### HTML

Trong markup, trước tiên chúng ta định nghĩa {{htmlelement("form")}} đầu vào cho phép người dùng đặt văn bản cần dịch và ngôn ngữ cần dịch sang. Điều này bao gồm {{htmlelement("textarea")}} để nhập văn bản, phần tử {{htmlelement("output")}} để hiển thị ngôn ngữ được phát hiện, và phần tử {{htmlelement("select")}} để chọn ngôn ngữ dịch.

```html live-sample___translator-example
<h2>Input</h2>

<form>
  <div>
    <label for="translate-text">Enter text to translate:</label>
    <textarea id="translate-text" name="translateText" rows="6"></textarea>
    <output class="detected-language">Detected language: </output>
  </div>
  <div>
    <label for="translate-language">Choose translation language:</label>
    <select id="translate-language" name="translateLanguage">
      <option value="en" selected>English (en)</option>
      <option value="fr">French (fr)</option>
      <option value="de">German (de)</option>
      <option value="it">Italian (it)</option>
      <option value="zh">Mandarin Chinese (zh)</option>
      <option value="zh-Hant">Taiwanese Mandarin (zh-Hant)</option>
      <option value="ja">Japanese (ja)</option>
      <option value="pt">Portuguese (pt)</option>
      <option value="ru">Russian (ru)</option>
      <option value="es">Spanish (es)</option>
      <option value="tr">Turkish (tr)</option>
      <option value="hi">Hindi (hi)</option>
      <option value="vi">Vietnamese (vi)</option>
      <option value="bn">Bengali (bn)</option>
    </select>
  </div>
  <button type="submit">Translate</button>
</form>
```

Phần thứ hai của markup bao gồm phần tử {{htmlelement("p")}} để hiển thị bản dịch được tạo ra.

```html live-sample___translator-example
<h2>Translation output</h2>

<p class="translate-output"></p>
```

```css hidden live-sample___translator-example
* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  max-width: 600px;
  margin: 0 auto;
}

form div {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin-bottom: 20px;
}

select,
textarea,
.translate-output {
  padding: 5px;
}

.translate-output {
  min-height: 150px;
  border: 1px solid black;
  width: 100%;
  display: block;
}

.error {
  color: red;
}
```

### JavaScript

Trong script, chúng ta bắt đầu bằng cách lấy tham chiếu đến các phần tử `<form>`, `<textarea>`, `<button>` gửi, `<p>` đầu ra dịch và `<output>` phát hiện ngôn ngữ. Chúng ta cũng khai báo biến `detectedLanguage` để chứa kết quả của các thao tác phát hiện ngôn ngữ.

```js live-sample___translator-example
const form = document.querySelector("form");
const textarea = document.querySelector("textarea");
const submitBtn = document.querySelector("button");

const translateOutput = document.querySelector(".translate-output");
const detectedLanguageOutput = document.querySelector(".detected-language");
let detectedLanguage = "";
```

Tiếp theo, chúng ta sử dụng phương thức {{domxref("EventTarget.addEventListener()")}} để lắng nghe hai sự kiện:

- Sự kiện `submit` trên phần tử `<form>`; khi form được gửi, hàm `handleTranslation()` được gọi.
- Sự kiện `input` trên phần tử `<textarea>`; khi giá trị `<textarea>` hiện tại thay đổi, hàm `detectLanguage()` được gọi.

```js live-sample___translator-example
form.addEventListener("submit", handleTranslation);
textarea.addEventListener("input", detectLanguage);
```

Hàm `detectLanguage()`, được định nghĩa tiếp theo, đầu tiên kiểm tra xem giá trị của phần tử `<textarea>` có lớn hơn 20 ký tự không. Nếu có, chúng ta tiến hành phát hiện ngôn ngữ. Nếu không, chúng ta vô hiệu hóa nút gửi và hiển thị thông báo nói rằng văn bản quá ngắn để phát hiện ngôn ngữ.

```js live-sample___translator-example
async function detectLanguage() {
  if (textarea.value.length > 20) {
    const detector = await LanguageDetector.create({
      monitor(monitor) {
        monitor.addEventListener("downloadprogress", (e) => {
          console.log(`Downloaded ${e.loaded * 100}%`);
        });
      },
    });

    const results = await detector.detect(textarea.value);
    detectedLanguageOutput.textContent = `Detected language: ${
      results[0].detectedLanguage
    }. Confidence: ${results[0].confidence.toFixed(4)}`;
    detectedLanguage = results[0].detectedLanguage;

    submitBtn.disabled = false;
  } else {
    detectedLanguageOutput.textContent = `Text too short to accurately detect language.`;
    detectedLanguage = "";

    submitBtn.disabled = true;
  }
}
```

Bây giờ chúng ta định nghĩa hàm `handleTranslation()`. Sau khi ngăn chặn gửi form mặc định, chúng ta tạo phiên bản {{domxref("FormData")}} mới chứa các cặp tên/giá trị dữ liệu `<form>`. Sau đó chúng ta chạy kiểm tra xác thực dữ liệu, kiểm tra xem ngôn ngữ nội dung `<textarea>` được phát hiện có giống với ngôn ngữ được chọn để dịch (`translateLanguage`) không. Nếu có, chúng ta in thông báo lỗi.

```js live-sample___translator-example
async function handleTranslation(e) {
  e.preventDefault();

  const formData = new FormData(form);

  if (formData.get("translateLanguage") === detectedLanguage) {
    translateOutput.innerHTML = `<span class="error">Input language and translation language are the same.</span>`;
    return;
  }
  translateOutput.innerHTML = "";
```

Nếu kiểm tra vượt qua, chúng ta mở khối `try { ... }`. Chúng ta bắt đầu bằng cách kiểm tra tính khả dụng của mô hình để dịch giữa ngôn ngữ đầu vào được phát hiện và ngôn ngữ đầu ra được chọn:

```js live-sample___translator-example
  try {
    const availability = await Translator.availability({
      sourceLanguage: detectedLanguage,
      targetLanguage: formData.get("translateLanguage"),
    });
    let translator;

    if (availability === "unavailable") {
      translateOutput.innerHTML = `<span class="error">Translation not available; try a different language combination.</span>`;
      return;
    } else if (availability === "available") {
      translator = await Translator.create({
        sourceLanguage: detectedLanguage,
        targetLanguage: formData.get("translateLanguage"),
      });
    } else {
      translator = await Translator.create({
        sourceLanguage: detectedLanguage,
        targetLanguage: formData.get("translateLanguage"),
        monitor(monitor) {
          monitor.addEventListener("downloadprogress", (e) => {
            translateOutput.textContent = `Downloaded ${Math.floor(
              e.loaded * 100
            )}%`;
          });
        },
      });
    }
```

Tiếp theo, chúng ta đặt nội dung `<p>` đầu ra thành thông báo đang chờ và vô hiệu hóa nút gửi trước khi gọi {{domxref("Translator.translate()")}} để thực hiện bản dịch thực sự. Sau khi bản dịch hoàn thành, chúng ta hiển thị nó trong `<p>` đầu ra trước khi bật lại nút gửi.

```js live-sample___translator-example
translateOutput.textContent = "...generating translation...";
submitBtn.disabled = true;

const translation = await translator.translate(formData.get("translateText"));

translateOutput.textContent = translation;
submitBtn.disabled = false;
```

Cuối cùng, chúng ta bao gồm khối `catch() { ... }` của khối `try`. Nếu nội dung `try` ném ra bất kỳ ngoại lệ nào, chúng ta hiển thị nó trong `<p>` đầu ra.

```js live-sample___translator-example
  } catch (e) {
    translateOutput.innerHTML = `<span class="error">${e}</span>`;
  }
}
```

### Kết quả

Ví dụ đã hiển thị trông như thế này:

{{EmbedLiveSample("translator-example", , "750px", , , , "translator; language-detector", "allow-forms")}}

Thử nhập một đoạn văn bản vào `<textarea>`, và lưu ý rằng ngôn ngữ được phát hiện và độ tin cậy chỉ được báo cáo khi số ký tự vượt quá 20. Chọn ngôn ngữ dịch khác với văn bản đầu vào của bạn, sau đó nhấn nút gửi để tạo bản dịch bằng AI.

Một số lựa chọn ngôn ngữ dịch có thể không có sẵn trong trình duyệt của bạn, ngay cả khi nó hỗ trợ các API.
