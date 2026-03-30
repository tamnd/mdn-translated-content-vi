---
title: Làm việc với JSON
short-title: JSON
slug: Learn_web_development/Core/Scripting/JSON
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Network_requests","Learn_web_development/Core/Scripting/Test_your_skills/JSON", "Learn_web_development/Core/Scripting")}}

JavaScript Object Notation (JSON) là định dạng văn bản tiêu chuẩn để biểu diễn dữ liệu có cấu trúc dựa trên cú pháp đối tượng JavaScript. Nó thường được sử dụng để truyền dữ liệu trong các ứng dụng web (ví dụ, gửi một số dữ liệu từ máy chủ đến máy khách, để nó có thể được hiển thị trên trang web, hoặc ngược lại). Bạn sẽ gặp nó khá thường xuyên, vì vậy trong bài viết này, chúng ta cung cấp cho bạn tất cả những gì bạn cần để làm việc với JSON bằng JavaScript, bao gồm phân tích cú pháp JSON để bạn có thể truy cập dữ liệu bên trong nó, và tạo JSON.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">kiến thức cơ bản về CSS</a>, quen thuộc với kiến thức cơ bản về JavaScript như đã trình bày trong các bài học trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>JSON là gì — định dạng dữ liệu được sử dụng rất phổ biến dựa trên cú pháp đối tượng JavaScript.</li>
          <li>JSON cũng có thể chứa mảng.</li>
          <li>Lấy JSON dưới dạng đối tượng JavaScript bằng các cơ chế có sẵn trong Web API (ví dụ, <code>Response.json()</code> trong Fetch API).</li>
          <li>Truy cập các giá trị bên trong dữ liệu JSON bằng cú pháp ngoặc và dấu chấm.</li>
          <li>Chuyển đổi giữa các đối tượng và văn bản bằng <code>JSON.parse()</code> và <code>JSON.stringify()</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Không, thực sự, JSON là gì?

{{glossary("JSON")}} là định dạng dữ liệu dựa trên văn bản theo cú pháp đối tượng JavaScript.
Nó biểu diễn dữ liệu có cấu trúc dưới dạng chuỗi, rất hữu ích khi bạn muốn truyền dữ liệu qua mạng.
Mặc dù nó rất giống với cú pháp object literal JavaScript, nhưng nó có thể được sử dụng độc lập với JavaScript. Nhiều môi trường lập trình có khả năng đọc (phân tích) và tạo JSON.
Trong JavaScript, các phương thức phân tích cú pháp và tạo JSON được cung cấp bởi đối tượng [`JSON`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON).

> [!NOTE]
> Chuyển đổi một chuỗi thành đối tượng gốc được gọi là _giải tuần tự hóa_, trong khi chuyển đổi đối tượng gốc thành chuỗi để nó có thể được truyền qua mạng được gọi là _tuần tự hóa_.

Một chuỗi JSON có thể được lưu trữ trong tệp riêng của nó, về cơ bản chỉ là tệp văn bản với phần mở rộng `.json`, và {{glossary("MIME type")}} là `application/json`.

### Cấu trúc JSON

Như mô tả ở trên, JSON là một chuỗi có định dạng rất giống với định dạng object literal JavaScript.
Sau đây là một chuỗi JSON hợp lệ biểu diễn một đối tượng.
Lưu ý rằng nó cũng là một đối tượng JavaScript literal hợp lệ — chỉ với một số [hạn chế cú pháp](#json_syntax_restrictions) thêm.

```json
{
  "squadName": "Super hero squad",
  "homeTown": "Metro City",
  "formed": 2016,
  "secretBase": "Super tower",
  "active": true,
  "members": [
    {
      "name": "Molecule Man",
      "age": 29,
      "secretIdentity": "Dan Jukes",
      "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
    },
    {
      "name": "Madame Uppercut",
      "age": 39,
      "secretIdentity": "Jane Wilson",
      "powers": [
        "Million tonne punch",
        "Damage resistance",
        "Superhuman reflexes"
      ]
    },
    {
      "name": "Eternal Flame",
      "age": 1000000,
      "secretIdentity": "Unknown",
      "powers": [
        "Immortality",
        "Heat Immunity",
        "Inferno",
        "Teleportation",
        "Interdimensional travel"
      ]
    }
  ]
}
```

Nếu bạn tải JSON này vào chương trình JavaScript dưới dạng chuỗi, bạn có thể phân tích cú pháp nó thành đối tượng thông thường và sau đó truy cập dữ liệu bên trong nó bằng cú pháp dấu chấm/ngoặc giống nhau mà chúng ta đã xem xét trong bài viết [Kiến thức cơ bản về đối tượng JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics).
Ví dụ:

```js
superHeroes.homeTown;
superHeroes.members[1].powers[2];
```

1. Đầu tiên, chúng ta có tên biến — `superHeroes`.
2. Bên trong đó, chúng ta muốn truy cập thuộc tính `members`, vì vậy chúng ta sử dụng `.members`.
3. `members` chứa một mảng được điền bởi các đối tượng. Chúng ta muốn truy cập đối tượng thứ hai bên trong mảng, vì vậy chúng ta sử dụng `[1]`.
4. Bên trong đối tượng này, chúng ta muốn truy cập thuộc tính `powers`, vì vậy chúng ta sử dụng `.powers`.
5. Bên trong thuộc tính `powers` là một mảng chứa các siêu năng lực của anh hùng được chọn. Chúng ta muốn cái thứ ba, vì vậy chúng ta sử dụng `[2]`.

Điểm mấu chốt là thực sự không có gì đặc biệt về việc làm việc với JSON; sau khi bạn phân tích cú pháp nó thành đối tượng JavaScript, bạn làm việc với nó giống như bạn làm với đối tượng được khai báo sử dụng cú pháp object literal tương tự.

> [!NOTE]
> Chúng ta đã làm cho JSON được xem ở trên có sẵn bên trong một biến trong ví dụ [JSONTest.html](https://mdn.github.io/learning-area/javascript/oojs/json/JSONTest.html) (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/javascript/oojs/json/JSONTest.html)).
> Hãy thử tải nó lên và sau đó truy cập dữ liệu bên trong biến thông qua bảng điều khiển JavaScript của trình duyệt bạn.

### Mảng dưới dạng JSON

Ở trên chúng ta đã đề cập rằng văn bản JSON về cơ bản trông giống như đối tượng JavaScript bên trong chuỗi.
Chúng ta cũng có thể chuyển đổi mảng sang/từ JSON. Ví dụ dưới đây là JSON hoàn toàn hợp lệ:

```json
[
  {
    "name": "Molecule Man",
    "age": 29,
    "secretIdentity": "Dan Jukes",
    "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
  },
  {
    "name": "Madame Uppercut",
    "age": 39,
    "secretIdentity": "Jane Wilson",
    "powers": [
      "Million tonne punch",
      "Damage resistance",
      "Superhuman reflexes"
    ]
  }
]
```

Bạn phải truy cập các mục mảng (trong phiên bản đã phân tích cú pháp) bằng cách bắt đầu với chỉ mục mảng, ví dụ `superHeroes[0].powers[0]`.

JSON cũng có thể chứa một giá trị nguyên thủy đơn. Ví dụ, `29`, `"Dan Jukes"`, hoặc `true` đều là JSON hợp lệ.

### Hạn chế cú pháp JSON

Như đã đề cập trước đó, bất kỳ JSON nào cũng là một JavaScript literal hợp lệ (đối tượng, mảng, số, v.v.). Điều ngược lại không đúng — không phải tất cả các JavaScript object literal đều là JSON hợp lệ.

- JSON chỉ có thể chứa các kiểu dữ liệu _có thể tuần tự hóa_. Điều này có nghĩa là:
  - Đối với các giá trị nguyên thủy, JSON có thể chứa các string literal, number literal, `true`, `false`, và `null`. Đặc biệt, nó không thể chứa `undefined`, `NaN`, hoặc `Infinity`.
  - Đối với các giá trị không phải nguyên thủy, JSON có thể chứa object literal và mảng, nhưng không phải hàm hoặc bất kỳ loại đối tượng nào khác, chẳng hạn như `Date`, `Set`, và `Map`. Các đối tượng và mảng bên trong JSON cần tiếp tục chứa các kiểu dữ liệu JSON hợp lệ.
- Các chuỗi phải được đặt trong ngoặc kép, không phải ngoặc đơn.
- Các số phải được viết theo ký hiệu thập phân.
- Mỗi thuộc tính của đối tượng phải ở dạng `"key": value`. Tên thuộc tính phải là string literal được đặt trong ngoặc kép. Cú pháp JavaScript đặc biệt, chẳng hạn như các phương thức, không được phép vì các phương thức là hàm, và hàm không phải là kiểu dữ liệu JSON hợp lệ.
- Đối tượng và mảng không thể chứa [dấu phẩy cuối](/en-US/docs/Web/JavaScript/Reference/Trailing_commas).
- Chú thích không được phép trong JSON.

Ngay cả một dấu phẩy hoặc dấu hai chấm bị đặt sai chỗ cũng có thể làm cho tệp JSON không hợp lệ và khiến nó thất bại.
Bạn nên cẩn thận để xác thực bất kỳ dữ liệu nào bạn đang cố sử dụng (mặc dù JSON được tạo bằng máy tính ít có khả năng bao gồm lỗi, miễn là chương trình tạo hoạt động đúng).
Bạn có thể xác thực JSON bằng một ứng dụng như [JSONLint](https://jsonlint.com/) hoặc [JSON-validate](https://www.json-validate.com/)

> [!NOTE]
> Bây giờ bạn đã đọc qua phần này, bạn cũng có thể muốn bổ sung việc học của mình với hướng dẫn tương tác [JSON review](https://scrimba.com/frontend-path-c0j/~0lt?via=mdn) của Scrimba <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>, cung cấp một số hướng dẫn hữu ích về cú pháp JSON cơ bản và cách xem dữ liệu yêu cầu JSON bên trong devtools của trình duyệt.

## Làm việc qua một ví dụ JSON

Vì vậy, hãy làm việc qua một ví dụ để xem cách chúng ta có thể sử dụng một số dữ liệu định dạng JSON trên một trang web.

### Bắt đầu

Để bắt đầu, hãy tạo bản sao cục bộ của các tệp [heroes.html](https://github.com/mdn/learning-area/blob/main/javascript/oojs/json/heroes.html) và [style.css](https://github.com/mdn/learning-area/blob/main/javascript/oojs/json/style.css) của chúng ta.
Tệp sau chứa một số CSS đơn giản để tạo kiểu cho trang của chúng ta, trong khi tệp trước chứa một số HTML body rất đơn giản, cộng với phần tử {{HTMLElement("script")}} để chứa mã JavaScript mà chúng ta sẽ viết trong bài tập này:

```html-nolint
<header>
...
</header>

<section>
...
</section>

<script>
// JavaScript goes here
</script>
```

Chúng ta đã làm cho dữ liệu JSON có sẵn trên GitHub của chúng ta, tại <https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json>.

Chúng ta sẽ tải JSON vào script của chúng ta và sử dụng một số thao tác DOM khéo léo để hiển thị nó, như thế này:

![Hình ảnh một tài liệu có tiêu đề "Super hero squad" (theo phông chữ lạ mắt) và phụ đề "Hometown: Metro City // Formed: 2016". Ba cột bên dưới tiêu đề được đặt tiêu đề "Molecule Man", "Madame Uppercut", và "Eternal Flame", tương ứng. Mỗi cột liệt kê tên danh tính bí mật, tuổi và siêu năng lực của anh hùng.](json-superheroes.png)

### Hàm cấp cao nhất

Hàm cấp cao nhất trông như thế này:

```js
async function populate() {
  const requestURL =
    "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json";
  const request = new Request(requestURL);

  const response = await fetch(request);
  const superHeroes = await response.json();

  populateHeader(superHeroes);
  populateHeroes(superHeroes);
}
```

Để lấy JSON, chúng ta sử dụng API gọi là [Fetch](/en-US/docs/Web/API/Fetch_API).
API này cho phép chúng ta thực hiện các yêu cầu mạng để lấy tài nguyên từ máy chủ qua JavaScript (ví dụ, hình ảnh, văn bản, JSON, thậm chí các đoạn HTML), có nghĩa là chúng ta có thể cập nhật các phần nhỏ của nội dung mà không cần tải lại toàn bộ trang.

Trong hàm của chúng ta, bốn dòng đầu tiên sử dụng Fetch API để tải JSON từ máy chủ:

- chúng ta khai báo biến `requestURL` để lưu URL GitHub
- chúng ta sử dụng URL để khởi tạo đối tượng {{domxref("Request")}} mới.
- chúng ta thực hiện yêu cầu mạng bằng hàm {{domxref("Window/fetch", "fetch()")}}, và điều này trả về đối tượng {{domxref("Response")}}
- chúng ta lấy phản hồi dưới dạng JSON bằng hàm {{domxref("Response/json", "json()")}} của đối tượng `Response`.

> [!NOTE]
> API `fetch()` là **bất đồng bộ**. Bạn có thể tìm hiểu về các hàm bất đồng bộ một cách chi tiết trong [module JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS) của chúng ta, nhưng bây giờ, chúng ta chỉ nói rằng chúng ta cần thêm từ khóa {{jsxref("Statements/async_function", "async")}} trước tên hàm sử dụng API fetch, và thêm từ khóa {{jsxref("Operators/await", "await")}} trước các lời gọi đến bất kỳ hàm bất đồng bộ nào.

Sau tất cả điều đó, biến `superHeroes` sẽ chứa đối tượng JavaScript dựa trên JSON. Sau đó chúng ta truyền đối tượng đó cho hai lời gọi hàm — hàm đầu tiên điền `<header>` với dữ liệu đúng, trong khi hàm thứ hai tạo một thẻ thông tin cho mỗi anh hùng trong đội, và chèn nó vào `<section>`.

### Điền vào tiêu đề

Bây giờ chúng ta đã lấy dữ liệu JSON và chuyển đổi nó thành đối tượng JavaScript, hãy sử dụng nó bằng cách viết hai hàm chúng ta đã tham chiếu ở trên. Trước tiên, hãy thêm định nghĩa hàm sau bên dưới mã trước:

```js
function populateHeader(obj) {
  const header = document.querySelector("header");
  const myH1 = document.createElement("h1");
  myH1.textContent = obj.squadName;
  header.appendChild(myH1);

  const myPara = document.createElement("p");
  myPara.textContent = `Hometown: ${obj.homeTown} // Formed: ${obj.formed}`;
  header.appendChild(myPara);
}
```

Ở đây chúng ta đầu tiên tạo phần tử {{HTMLElement("Heading_Elements", "h1")}} với [`createElement()`](/en-US/docs/Web/API/Document/createElement), đặt [`textContent`](/en-US/docs/Web/API/Node/textContent) của nó bằng thuộc tính `squadName` của đối tượng, sau đó thêm nó vào tiêu đề bằng [`appendChild()`](/en-US/docs/Web/API/Node/appendChild). Sau đó chúng ta thực hiện thao tác tương tự với một đoạn văn: tạo nó, đặt nội dung văn bản và thêm nó vào tiêu đề. Sự khác biệt duy nhất là văn bản của nó được đặt thành [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals) chứa cả thuộc tính `homeTown` và `formed` của đối tượng.

### Tạo thẻ thông tin anh hùng

Tiếp theo, hãy thêm hàm sau ở cuối mã, tạo và hiển thị các thẻ siêu anh hùng:

```js
function populateHeroes(obj) {
  const section = document.querySelector("section");
  const heroes = obj.members;

  for (const hero of heroes) {
    const myArticle = document.createElement("article");
    const myH2 = document.createElement("h2");
    const myPara1 = document.createElement("p");
    const myPara2 = document.createElement("p");
    const myPara3 = document.createElement("p");
    const myList = document.createElement("ul");

    myH2.textContent = hero.name;
    myPara1.textContent = `Secret identity: ${hero.secretIdentity}`;
    myPara2.textContent = `Age: ${hero.age}`;
    myPara3.textContent = "Superpowers:";

    const superPowers = hero.powers;
    for (const power of superPowers) {
      const listItem = document.createElement("li");
      listItem.textContent = power;
      myList.appendChild(listItem);
    }

    myArticle.appendChild(myH2);
    myArticle.appendChild(myPara1);
    myArticle.appendChild(myPara2);
    myArticle.appendChild(myPara3);
    myArticle.appendChild(myList);

    section.appendChild(myArticle);
  }
}
```

Để bắt đầu, chúng ta lưu thuộc tính `members` của đối tượng JavaScript trong một biến mới. Mảng này chứa nhiều đối tượng chứa thông tin cho mỗi anh hùng.

Tiếp theo, chúng ta sử dụng [vòng lặp `for...of`](/en-US/docs/Learn_web_development/Core/Scripting/Loops#the_for...of_loop) để lặp qua mỗi đối tượng trong mảng. Đối với mỗi đối tượng, chúng ta:

1. Tạo một số phần tử mới: một `<article>`, một `<h2>`, ba `<p>` và một `<ul>`.
2. Đặt `<h2>` chứa `name` của anh hùng hiện tại.
3. Điền ba đoạn văn với `secretIdentity`, `age` của họ và một dòng "Superpowers:" để giới thiệu thông tin trong danh sách.
4. Lưu thuộc tính `powers` trong hằng số mới gọi là `superPowers` — chứa mảng liệt kê các siêu năng lực của anh hùng hiện tại.
5. Sử dụng vòng lặp `for...of` khác để lặp qua các siêu năng lực của anh hùng hiện tại — đối với mỗi cái, chúng ta tạo phần tử `<li>`, đặt siêu năng lực bên trong nó, sau đó đặt `listItem` bên trong phần tử `<ul>` (`myList`) bằng `appendChild()`.
6. Điều cuối cùng chúng ta làm là thêm `<h2>`, các `<p>` và `<ul>` bên trong `<article>` (`myArticle`), sau đó thêm `<article>` bên trong `<section>`. Thứ tự các thứ được thêm vào là quan trọng, vì đây là thứ tự chúng sẽ được hiển thị bên trong HTML.

> [!NOTE]
> Nếu bạn gặp khó khăn khi làm ví dụ hoạt động, hãy thử tham khảo mã nguồn [heroes-finished.html](https://github.com/mdn/learning-area/blob/main/javascript/oojs/json/heroes-finished.html) của chúng ta (xem nó [đang chạy trực tiếp](https://mdn.github.io/learning-area/javascript/oojs/json/heroes-finished.html) cũng vậy.)

> [!NOTE]
> Nếu bạn gặp khó khăn theo dõi cú pháp dấu chấm/ngoặc chúng ta đang sử dụng để truy cập đối tượng JavaScript, nó có thể giúp ích nếu bạn mở tệp [superheroes.json](https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json) trong tab khác hoặc trình soạn thảo văn bản của bạn, và tham khảo nó khi bạn xem JavaScript của chúng ta.
> Bạn cũng nên xem lại bài viết [Kiến thức cơ bản về đối tượng JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics) để biết thêm thông tin về cú pháp dấu chấm và ngoặc.

### Gọi hàm cấp cao nhất

Cuối cùng, chúng ta cần gọi hàm `populate()` cấp cao nhất:

```js
populate();
```

## Chuyển đổi giữa đối tượng và văn bản

Ví dụ trên đơn giản về mặt truy cập đối tượng JavaScript, vì chúng ta chuyển đổi phản hồi mạng trực tiếp thành đối tượng JavaScript bằng `response.json()`.

Nhưng đôi khi chúng ta không may mắn như vậy — đôi khi chúng ta nhận được chuỗi JSON thô, và chúng ta cần chuyển đổi nó thành đối tượng tự mình. Và khi chúng ta muốn gửi đối tượng JavaScript qua mạng, chúng ta cần chuyển đổi nó thành JSON (chuỗi) trước khi gửi. Rất may, hai vấn đề này phổ biến đến mức đối tượng [JSON](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON) tích hợp sẵn có sẵn trong các trình duyệt, chứa hai phương thức sau:

- [`parse()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse): Chấp nhận chuỗi JSON làm tham số và trả về đối tượng JavaScript tương ứng.
- [`stringify()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify): Chấp nhận đối tượng làm tham số và trả về chuỗi JSON tương đương.

Bạn có thể thấy cái đầu tiên trong hành động trong ví dụ [heroes-finished-json-parse.html](https://mdn.github.io/learning-area/javascript/oojs/json/heroes-finished-json-parse.html) của chúng ta (xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/javascript/oojs/json/heroes-finished-json-parse.html)) — điều này làm chính xác điều tương tự như ví dụ chúng ta đã xây dựng trước đó, ngoại trừ:

- chúng ta lấy phản hồi dưới dạng văn bản thay vì JSON, bằng cách gọi phương thức {{domxref("Response/text", "text()")}} của phản hồi
- sau đó chúng ta sử dụng `parse()` để chuyển đổi văn bản thành đối tượng JavaScript.

Đoạn mã chính là ở đây:

```js
async function populate() {
  const requestURL =
    "https://mdn.github.io/learning-area/javascript/oojs/json/superheroes.json";
  const request = new Request(requestURL);

  const response = await fetch(request);
  const superHeroesText = await response.text();

  const superHeroes = JSON.parse(superHeroesText);
  populateHeader(superHeroes);
  populateHeroes(superHeroes);
}
```

Như bạn có thể đoán, `stringify()` hoạt động theo chiều ngược lại. Hãy thử nhập các dòng sau vào bảng điều khiển JavaScript của trình duyệt của bạn từng dòng một để xem nó trong hành động:

```js
let myObj = { name: "Chris", age: 38 };
myObj;
let myString = JSON.stringify(myObj);
myString;
```

Ở đây chúng ta đang tạo đối tượng JavaScript, kiểm tra nội dung của nó, chuyển đổi nó thành chuỗi JSON bằng `stringify()` — lưu giá trị trả về trong biến mới — sau đó kiểm tra lại nó.

## Tóm tắt

Trong bài học này, chúng ta đã giới thiệu cho bạn cách sử dụng JSON trong các chương trình của bạn, bao gồm cách tạo và phân tích cú pháp JSON, và cách truy cập dữ liệu bị khóa bên trong nó. Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ tất cả thông tin này.

## Xem thêm

- [JSON reference](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON)
- [Fetch API overview](/en-US/docs/Web/API/Fetch_API)
- [Using Fetch](/en-US/docs/Web/API/Fetch_API/Using_Fetch)
- [HTTP request methods](/en-US/docs/Web/HTTP/Reference/Methods)

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Network_requests","Learn_web_development/Core/Scripting/Test_your_skills/JSON", "Learn_web_development/Core/Scripting")}}
