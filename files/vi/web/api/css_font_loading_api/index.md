---
title: CSS Font Loading API
slug: Web/API/CSS_Font_Loading_API
page-type: web-api-overview
browser-compat: api.FontFace
---

{{DefaultAPISidebar("CSS Font Loading API")}}{{AvailableInWorkers}}

**CSS Font Loading API** cung cấp các sự kiện và giao diện để tải động tài nguyên phông chữ.

## Khái niệm và cách sử dụng

Các stylesheet CSS cho phép tác giả sử dụng phông chữ tùy chỉnh; chỉ định các phông chữ cần tải xuống bằng quy tắc {{cssxref("@font-face")}}, và áp dụng chúng cho các phần tử bằng thuộc tính {{cssxref("font-family")}}.
Thời điểm một phông chữ được tải xuống do user agent kiểm soát.
Hầu hết user agent chỉ tìm nạp và tải phông chữ khi chúng lần đầu tiên cần đến, điều này có thể dẫn đến độ trễ dễ nhận thấy.

CSS Font Loading API khắc phục vấn đề này bằng cách cho phép tác giả kiểm soát và theo dõi thời điểm một font face được tìm nạp và tải, cũng như thời điểm nó được thêm vào tập font face do tài liệu hoặc worker sở hữu.
Việc thêm một font face vào tập font face của tài liệu hoặc worker cho phép user agent tự động tìm nạp và tải tài nguyên phông chữ liên quan nếu cần.
Một font face có thể được tải trước hoặc sau khi được thêm vào tập font face, nhưng nó _phải_ được thêm vào tập này trước khi có thể dùng để vẽ.

Các font face được định nghĩa trong các đối tượng {{domxref('FontFace')}}, chỉ định nguồn phông chữ dạng nhị phân hoặc URL cùng các thuộc tính khác của phông chữ theo cách gần giống với quy tắc CSS {{cssxref("@font-face")}}.
Các đối tượng `FontFace` được thêm vào {{domxref('FontFaceSet')}} của tài liệu hoặc worker bằng {{domxref("Document.fonts")}} và {{domxref("WorkerGlobalScope.fonts")}}, tương ứng.
Tác giả có thể kích hoạt việc tải phông chữ bằng `FontFace` hoặc `FontFaceSet`, đồng thời theo dõi quá trình tải hoàn tất.
Ngoài ra, `FontFaceSet` còn có thể dùng để xác định khi nào tất cả phông chữ mà một trang yêu cầu đã tải xong và bố cục tài liệu đã hoàn tất.

Thuộc tính {{domxref('FontFace.status')}} cho biết trạng thái tải của font face: `unloaded`, `loading`, `loaded` hoặc `failed`.
Trạng thái này ban đầu là `unloaded`.
Nó được đặt thành `loading` khi tệp đang được tải xuống hoặc dữ liệu phông chữ đang được xử lý, và thành `failed` nếu định nghĩa phông chữ không hợp lệ hoặc không thể tải dữ liệu phông chữ.
Trạng thái được đặt thành `loaded` khi dữ liệu font face đã được tìm nạp thành công (nếu cần) và đã tải xong.

### Định nghĩa một font face

Các font face được tạo bằng [`FontFace` constructor](/en-US/docs/Web/API/FontFace/FontFace), nhận các tham số: font family, nguồn phông chữ, và các descriptor tùy chọn.
Định dạng và cú pháp của các đối số này giống với định nghĩa {{cssxref("@font-face")}} tương ứng.

Nguồn phông chữ có thể là dữ liệu nhị phân trong một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) hoặc là một tài nguyên phông chữ tại một URL.
Một định nghĩa font face điển hình dùng nguồn URL có thể như bên dưới.
Lưu ý rằng hàm `url()` là bắt buộc đối với nguồn phông chữ URL.

```js
const font = new FontFace("my-font", 'url("my-font.woff")', {
  style: "italic",
  weight: "400",
  stretch: "condensed",
});
```

> [!NOTE]
> Tương tự `@font-face`, một số descriptor biểu thị dữ liệu dự kiến có trong dữ liệu phông chữ và được dùng để đối sánh phông chữ, trong khi những descriptor khác thực sự đặt/định nghĩa các thuộc tính của font face được tạo ra.
> Ví dụ, việc đặt `style` thành `"italic"` cho biết tệp chứa các phông chữ nghiêng; tác giả có trách nhiệm chỉ định một tệp mà điều này là đúng.

Các font face có _nguồn nhị phân_ sẽ tự động được tải nếu định nghĩa phông chữ hợp lệ và dữ liệu phông chữ có thể được tải. Khi thành công, {{domxref('FontFace.status')}} được đặt thành `loaded`, nếu không thì là `failed`.
Các font face có nguồn URL sẽ được kiểm tra tính hợp lệ nhưng không tự động tải. Nếu định nghĩa font face hợp lệ thì {{domxref('FontFace.status')}} được đặt thành `unloaded`, nếu không thì là `failed`.

### Thêm phông chữ vào tài liệu hoặc worker

Các font face thường được thêm vào {{domxref('FontFaceSet')}} của tài liệu hoặc worker để cho phép user agent tự động tải phông chữ khi cần, và chúng _phải_ được thêm vào đó thì phông chữ mới có thể được dùng để render văn bản.

Đoạn mã dưới đây cho thấy một font face được thêm vào tài liệu.

```js
// Define a FontFace
const font = new FontFace("my-font", 'url("my-font.woff")', {
  style: "italic",
  weight: "400",
  stretch: "condensed",
});

// Add to the document.fonts (FontFaceSet)
document.fonts.add(font);
```

### Tải phông chữ

Một font face có thể được tải thủ công bằng cách gọi {{domxref('FontFace.load()')}}, hoặc bằng cách gọi {{domxref('FontFaceSet.load()')}} nếu font face đó đã được thêm vào `FontFaceSet`.
Lưu ý rằng việc cố tải một phông chữ đã được tải sẽ không có tác dụng.

Đoạn mã dưới đây cho thấy cách định nghĩa một font face, thêm nó vào phông chữ của tài liệu, rồi khởi tạo việc tải phông chữ.

```js
// Define a FontFace
const font = new FontFace("my-font", 'url("my-font.woff")');

// Add to the document.fonts (FontFaceSet)
document.fonts.add(font);

// Load the font
font.load();

// Wait until the fonts are all loaded
document.fonts.ready.then(() => {
  // Use the font to render text (for example, in a canvas)
});
```

Lưu ý rằng `font.load()` trả về một promise, vì vậy chúng ta cũng có thể xử lý việc tải phông chữ hoàn tất bằng cách nối `then` phía sau.
Trong một số trường hợp, dùng [`document.fonts.ready`](/en-US/docs/Web/API/FontFaceSet/ready) có thể tốt hơn, vì nó chỉ được gọi khi mọi phông chữ trong tài liệu đã được giải quyết và bố cục đã hoàn tất.

## Giao diện

- {{domxref('FontFace')}}
  - : Biểu diễn một font face đơn lẻ có thể sử dụng.
- {{domxref('FontFaceSet')}}
  - : Giao diện tải các font face và kiểm tra trạng thái tải xuống của chúng.
- {{domxref('FontFaceSetLoadEvent')}}
  - : Được kích hoạt mỗi khi một {{domxref("FontFaceSet")}} tải.

## Ví dụ

### Tải phông chữ cơ bản

Đây là một ví dụ rất đơn giản cho thấy một phông chữ được tải từ Google Fonts và được dùng để vẽ văn bản lên canvas.
Ví dụ này cũng ghi lại `status` ngay sau khi tạo và sau khi tải.

#### HTML

Đoạn mã này định nghĩa một canvas để vẽ và một textarea để ghi log.

```html
<canvas id="js-canvas"></canvas>
<textarea id="log" rows="3" cols="100"></textarea>
```

#### JavaScript

Đầu tiên chúng ta lấy phần tử sẽ dùng để ghi log, và canvas sẽ được dùng để render văn bản bằng phông chữ đã tải về.

```js
const log = document.getElementById("log");

const canvas = document.getElementById("js-canvas");
canvas.width = 650;
canvas.height = 75;
```

Tiếp theo, chúng ta định nghĩa một `FontFace` có nguồn URL là một phông chữ từ Google Fonts và thêm nó vào `document.fonts`.
Sau đó chúng ta ghi lại trạng thái phông chữ, lúc này phải là `unloaded`.

```js
const bitterFontFace = new FontFace(
  "FontFamily Bitter",
  'url("https://fonts.gstatic.com/s/bitter/v7/HEpP8tJXlWaYHimsnXgfCOvvDin1pK8aKteLpeZ5c0A.woff2")',
);
document.fonts.add(bitterFontFace);
log.textContent += `Bitter font: ${bitterFontFace.status}\n`; // > Bitter font: unloaded
```

Sau đó, chúng ta gọi phương thức {{domxref('FontFace.load()')}} để tải font face và chờ promise được trả về.
Khi promise được resolve, chúng ta ghi lại trạng thái đã tải (trạng thái này phải là `loaded`) và vẽ văn bản bằng phông chữ đã tải lên canvas.

```js
bitterFontFace.load().then(
  () => {
    log.textContent += `Bitter font: ${bitterFontFace.status}\n`; // > Bitter font: loaded

    const ctx = canvas.getContext("2d");
    ctx.font = '36px "FontFamily Bitter"';
    ctx.fillText("Bitter font loaded", 20, 50);
  },
  (err) => {
    console.error(err);
  },
);
```

Lưu ý rằng chúng ta cũng có thể chờ promise được trả về bởi thuộc tính {{domxref('FontFace.loaded')}}, hoặc chờ {{domxref('FontFaceSet.ready')}}.

#### Kết quả

Kết quả được hiển thị bên dưới.
Nó sẽ cho thấy tên của phông chữ được vẽ trên canvas bằng phông chữ đã tải xuống, cùng với một log hiển thị trạng thái tải trước và sau khi tải.

{{ EmbedLiveSample('Basic font loading', 700, 180) }}

### Tải phông chữ bằng sự kiện

Ví dụ này tương tự ví dụ trước, ngoại trừ việc nó dùng {{domxref('FontFaceSet.load()')}} để tải phông chữ.
Nó cũng minh họa cách lắng nghe các sự kiện tải phông chữ.

#### HTML

```html
<canvas id="js-canvas"></canvas>
<textarea id="log" rows="25" cols="100"></textarea>
```

#### JavaScript

Đoạn mã dưới đây định nghĩa một ngữ cảnh canvas để vẽ văn bản, định nghĩa một font face, rồi thêm nó vào tập font face của tài liệu.

```js
const log = document.getElementById("log");

const canvas = document.getElementById("js-canvas");
canvas.width = 650;
canvas.height = 75;
const ctx = canvas.getContext("2d");

const oxygenFontFace = new FontFace(
  "FontFamily Oxygen",
  'url("https://fonts.gstatic.com/s/oxygen/v5/qBSyz106i5ud7wkBU-FrPevvDin1pK8aKteLpeZ5c0A.woff2")',
);
document.fonts.add(oxygenFontFace);
log.textContent += `Oxygen status: ${oxygenFontFace.status}\n`;
```

Tiếp theo, chúng ta dùng `load()` trên tập font face để tải phông chữ, chỉ định phông chữ nào cần tải.
Phương thức trả về một {{jsxref("Promise")}}.
Nếu promise được resolve, chúng ta dùng phông chữ để vẽ một vài đoạn văn bản.
Nếu bị reject, lỗi sẽ được ghi log.

```js
document.fonts.load("36px FontFamily Oxygen").then(
  (fonts) => {
    log.textContent += `Bitter font: ${fonts}\n`; // > Oxygen font: loaded
    log.textContent += `Bitter font: ${oxygenFontFace.status}\n`; // > Oxygen font: loaded
    ctx.font = '36px "FontFamily Oxygen"';
    ctx.fillText("Oxygen font loaded", 20, 50);
  },
  (err) => {
    console.error(err);
  },
);
```

Thay vì chờ promise, chúng ta cũng có thể dùng các sự kiện để theo dõi thao tác tải phông chữ.
Đoạn mã dưới đây lắng nghe các sự kiện `loading` và `loadingerror`, rồi ghi lại số lượng font face cho từng trường hợp.
Trong bộ lắng nghe sự kiện `loadingdone`, chúng ta còn duyệt qua các font face và ghi lại tên family.

```js
document.fonts.addEventListener("loading", (event) => {
  log.textContent += `loading_event: ${event.fontfaces.length}\n`;
});
document.fonts.addEventListener("loadingerror", (event) => {
  log.textContent += `loadingerror_event: ${event.fontfaces.length}\n`;
});
document.fonts.addEventListener("loadingdone", (event) => {
  log.textContent += `loadingdone_event: ${event.fontfaces.length}\n`;
  event.fontfaces.forEach((value) => {
    log.textContent += `  fontface: ${value.family}\n`;
  });
});
```

Phần mã cuối cùng minh họa cách bạn có thể theo dõi việc tải phông chữ hoàn tất bằng promise được trả về bởi {{domxref('FontFaceSet.ready')}}.
Không giống các cơ chế khác, cơ chế này trả về khi tất cả phông chữ được định nghĩa trong tài liệu đã được tải xuống và bố cục đã hoàn tất.

Khi promise được resolve, chúng ta duyệt qua các giá trị trong các font face của tài liệu.

```js
document.fonts.ready.then(() => {
  log.textContent += `\nFontFaces in document: ${document.fonts.size}.\n`;

  for (const fontFace of document.fonts.values()) {
    log.textContent += "FontFace:\n";
    for (const property in fontFace) {
      log.textContent += `  ${property}: ${fontFace[property]}\n`;
    }
  }
});
```

#### Kết quả

Kết quả bên dưới cho thấy văn bản được vẽ bằng phông chữ "Oxygen".
Nó cũng hiển thị log từ các sự kiện và thời điểm promise do `document.fonts.ready` trả về được resolve.

{{ EmbedLiveSample('Font loading with events', 700, 520) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
