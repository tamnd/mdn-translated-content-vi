---
title: Các tính năng chính của framework
short-title: Tính năng của framework
slug: Learn_web_development/Core/Frameworks_libraries/Main_features
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Introduction","Learn_web_development/Core/Frameworks_libraries/React_getting_started", "Learn_web_development/Core/Frameworks_libraries")}}

Mỗi framework JavaScript lớn có cách tiếp cận khác nhau để cập nhật DOM, xử lý sự kiện trình duyệt và cung cấp trải nghiệm nhà phát triển dễ chịu. Bài viết này sẽ khám phá các tính năng chính của "bốn ông lớn" framework, xem xét cách framework thường hoạt động ở cấp độ cao, và sự khác biệt giữa chúng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>Hiểu các tính năng chính được cung cấp bởi các framework JavaScript.</td>
    </tr>
  </tbody>
</table>

## Ngôn ngữ đặc thù miền

Hầu hết các framework cho phép bạn sử dụng ngôn ngữ đặc thù miền (DSL) để xây dựng ứng dụng của mình. Cụ thể, React đã phổ biến hóa việc sử dụng **JSX** để viết các thành phần của nó, trong khi Ember sử dụng **Handlebars**. Không giống như HTML, những ngôn ngữ này biết cách đọc các biến dữ liệu, và dữ liệu này có thể được sử dụng để hợp lý hóa quá trình viết giao diện người dùng của bạn.

Các ứng dụng Angular thường sử dụng nhiều **TypeScript**. TypeScript không liên quan đến việc viết giao diện người dùng, nhưng nó là một ngôn ngữ đặc thù miền, và có sự khác biệt đáng kể so với JavaScript thuần túy.

Các DSL không thể được trình duyệt đọc trực tiếp; chúng phải được chuyển đổi thành JavaScript hoặc HTML trước. Công cụ framework thường bao gồm các công cụ cần thiết để xử lý bước này, hoặc có thể được điều chỉnh để bao gồm bước này. Mặc dù có thể xây dựng ứng dụng framework mà không sử dụng các ngôn ngữ đặc thù miền này, việc chấp nhận chúng sẽ hợp lý hóa quá trình phát triển của bạn và giúp dễ dàng tìm kiếm trợ giúp từ cộng đồng xung quanh các framework đó.

### JSX

[JSX](https://react.dev/learn/writing-markup-with-jsx), viết tắt của JavaScript và XML, là một phần mở rộng của JavaScript mang cú pháp giống HTML vào môi trường JavaScript. Nó được nhóm React phát minh để sử dụng trong các ứng dụng React, nhưng có thể được sử dụng để phát triển các ứng dụng khác — như ứng dụng Vue chẳng hạn.

Sau đây là một ví dụ JSX đơn giản:

```jsx
const subject = "World";
const header = (
  <header>
    <h1>Hello, {subject}!</h1>
  </header>
);
```

Biểu thức này đại diện cho một phần tử HTML [`<header>`](/en-US/docs/Web/HTML/Reference/Elements/header) với một phần tử [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) bên trong. Dấu ngoặc nhọn xung quanh `{subject}` cho ứng dụng biết để đọc giá trị của hằng số `subject` và chèn nó vào `<h1>` của chúng ta.

Khi được sử dụng với React, JSX từ đoạn code trước sẽ được biên dịch thành:

```js
const subject = "World";
const header = React.createElement(
  "header",
  null,
  React.createElement("h1", null, "Hello, ", subject, "!"),
);
```

Khi cuối cùng được kết xuất bởi trình duyệt, đoạn code trên sẽ tạo ra HTML trông như thế này:

```html
<header>
  <h1>Hello, World!</h1>
</header>
```

### Handlebars

Ngôn ngữ mẫu [Handlebars](https://handlebarsjs.com/) không dành riêng cho các ứng dụng Ember, nhưng được sử dụng nhiều trong các ứng dụng Ember. Code Handlebars giống HTML, nhưng nó có tùy chọn kéo dữ liệu từ nơi khác. Dữ liệu này có thể được sử dụng để ảnh hưởng đến HTML mà ứng dụng cuối cùng xây dựng.

Giống như JSX, Handlebars sử dụng dấu ngoặc nhọn để chèn giá trị của một biến. Handlebars sử dụng một cặp dấu ngoặc nhọn kép, thay vì một cặp.

Cho mẫu Handlebars này:

```html
<header>
  <h1>Hello, \{{subject}}!</h1>
</header>
```

Và dữ liệu này:

```json
{
  "subject": "World"
}
```

Handlebars sẽ xây dựng HTML như thế này:

```html
<header>
  <h1>Hello, World!</h1>
</header>
```

### TypeScript

[TypeScript](https://www.typescriptlang.org/) là một _tập hợp mở rộng_ của JavaScript, nghĩa là nó mở rộng JavaScript — tất cả code JavaScript đều hợp lệ TypeScript, nhưng không phải ngược lại. TypeScript hữu ích vì tính nghiêm ngặt mà nó cho phép các nhà phát triển thực thi trên code của họ. Ví dụ, hãy xem xét hàm `add()`, nhận các số nguyên `a` và `b` và trả về tổng của chúng.

Trong JavaScript, hàm đó có thể được viết như thế này:

```js
function add(a, b) {
  return a + b;
}
```

Code này có thể đơn giản đối với người quen thuộc với JavaScript, nhưng nó vẫn có thể rõ ràng hơn. JavaScript cho phép chúng ta sử dụng toán tử `+` để nối các chuỗi lại với nhau, vì vậy hàm này về mặt kỹ thuật vẫn sẽ hoạt động nếu `a` và `b` là chuỗi — nó chỉ có thể không cho bạn kết quả bạn mong đợi. Nếu chúng ta muốn chỉ cho phép truyền số vào hàm này? TypeScript làm điều đó có thể:

```ts
function add(a: number, b: number) {
  return a + b;
}
```

`: number` được viết sau mỗi tham số ở đây cho TypeScript biết rằng cả `a` và `b` đều phải là số. Nếu chúng ta sử dụng hàm này và truyền `'2'` vào đó như một đối số, TypeScript sẽ phát sinh lỗi trong quá trình biên dịch, và chúng ta sẽ buộc phải sửa lỗi của mình. Chúng ta có thể viết JavaScript của riêng mình để phát sinh những lỗi này, nhưng điều đó sẽ làm cho code nguồn của chúng ta phức tạp hơn đáng kể. Có lẽ sẽ có ý nghĩa hơn nếu để TypeScript xử lý những kiểm tra như vậy cho chúng ta.

## Viết thành phần

Như đã đề cập trong bài học trước, hầu hết các framework đều có một loại mô hình thành phần nào đó. Các thành phần React có thể được viết bằng JSX, các thành phần Ember bằng Handlebars, và các thành phần Angular và Vue với cú pháp mẫu mở rộng nhẹ HTML.

Bất kể ý kiến của họ về cách viết thành phần như thế nào, các thành phần của mỗi framework đều cung cấp cách mô tả các thuộc tính bên ngoài mà chúng có thể cần, trạng thái nội bộ mà thành phần nên quản lý, và các sự kiện mà người dùng có thể kích hoạt trên đánh dấu của thành phần.

Các đoạn code trong phần còn lại của phần này sẽ sử dụng React làm ví dụ, và được viết bằng JSX.

### Thuộc tính

Thuộc tính, hay **props**, là dữ liệu bên ngoài mà một thành phần cần để kết xuất. Giả sử bạn đang xây dựng một trang web cho một tạp chí trực tuyến, và bạn cần đảm bảo rằng mỗi tác giả đóng góp nhận được ghi nhận cho công việc của họ. Bạn có thể tạo một thành phần `AuthorCredit` để đi kèm với mỗi bài viết. Thành phần này cần hiển thị ảnh chân dung của tác giả và một dòng giới thiệu ngắn về họ. Để biết hình ảnh nào cần kết xuất và dòng giới thiệu nào cần in, `AuthorCredit` cần chấp nhận một số props.

Biểu diễn React của thành phần `AuthorCredit` này có thể trông như thế này:

```jsx
function AuthorCredit(props) {
  return (
    <figure>
      <img src={props.src} alt={props.alt} />
      <figcaption>{props.byline}</figcaption>
    </figure>
  );
}
```

`{props.src}`, `{props.alt}`, và `{props.byline}` đại diện cho nơi props của chúng ta sẽ được chèn vào thành phần. Để kết xuất thành phần này, chúng ta sẽ viết code như thế này tại nơi chúng ta muốn nó được kết xuất (có thể là bên trong một thành phần khác):

```jsx
<AuthorCredit
  src="./assets/zelda.png"
  alt="Portrait of Zelda Schiff"
  byline="Zelda Schiff is editor-in-chief of the Library Times."
/>
```

Điều này cuối cùng sẽ kết xuất phần tử [`<figure>`](/en-US/docs/Web/HTML/Reference/Elements/figure) sau trong trình duyệt, với cấu trúc của nó được định nghĩa trong thành phần `AuthorCredit`, và nội dung của nó được định nghĩa trong các props được bao gồm trong lời gọi thành phần `AuthorCredit`:

```html
<figure>
  <img src="assets/zelda.png" alt="Portrait of Zelda Schiff" />
  <figcaption>Zelda Schiff is editor-in-chief of the Library Times.</figcaption>
</figure>
```

### Trạng thái

Chúng ta đã nói về khái niệm **trạng thái** trong chương trước — một cơ chế xử lý trạng thái mạnh mẽ là chìa khóa cho một framework hiệu quả, và mỗi thành phần có thể có dữ liệu cần trạng thái của nó được kiểm soát. Trạng thái này sẽ tồn tại theo một cách nào đó miễn là thành phần đang được sử dụng. Giống như props, trạng thái có thể được sử dụng để ảnh hưởng đến cách một thành phần được kết xuất.

Ví dụ, hãy xem xét một nút đếm số lần nó đã được nhấp. Thành phần này nên chịu trách nhiệm theo dõi trạng thái _đếm_ của riêng mình, và có thể được viết như thế này:

```jsx
function CounterButton() {
  const [count] = useState(0);
  return <button>Clicked {count} times</button>;
}
```

[`useState()`](https://react.dev/reference/react/useState) là một **[React hook](https://react.dev/reference/react)** mà, với một giá trị dữ liệu ban đầu, sẽ theo dõi giá trị đó khi nó được cập nhật. Code sẽ được kết xuất ban đầu như thế này trong trình duyệt:

```html
<button>Clicked 0 times</button>
```

Lời gọi `useState()` theo dõi giá trị `count` theo cách mạnh mẽ trên toàn ứng dụng, mà không cần bạn viết code để tự làm điều đó.

### Sự kiện

Để có tính tương tác, các thành phần cần cách để phản hồi các sự kiện trình duyệt, vì vậy ứng dụng của chúng ta có thể phản hồi người dùng. Mỗi framework cung cấp cú pháp riêng để lắng nghe các sự kiện trình duyệt, tham chiếu đến tên của các sự kiện trình duyệt gốc tương đương.

Trong React, lắng nghe sự kiện [`click`](/en-US/docs/Web/API/Element/click_event) yêu cầu một thuộc tính đặc biệt, `onClick`. Hãy cập nhật code `CounterButton` của chúng ta từ trên để cho phép nó đếm các lần nhấp:

```jsx
function CounterButton() {
  const [count, setCount] = useState(0);
  return (
    <button onClick={() => setCount(count + 1)}>Clicked {count} times</button>
  );
}
```

Trong phiên bản này, chúng ta đang sử dụng chức năng bổ sung của `useState()` để tạo một hàm `setCount()` đặc biệt, mà chúng ta có thể gọi để cập nhật giá trị của `count`. Chúng ta gọi hàm này bên trong trình xử lý sự kiện `onClick` để đặt `count` thành bất cứ giá trị hiện tại của nó là, cộng thêm một.

## Tạo kiểu cho thành phần

Mỗi framework cung cấp một cách để định nghĩa các kiểu dáng cho thành phần của bạn — hoặc cho toàn bộ ứng dụng. Mặc dù cách tiếp cận của mỗi framework để định nghĩa kiểu dáng của một thành phần hơi khác nhau, tất cả chúng đều cung cấp cho bạn nhiều cách để làm. Với việc thêm một số module trợ giúp, bạn có thể tạo kiểu cho ứng dụng framework của mình bằng [Sass](https://sass-lang.com/) hoặc [Less](https://lesscss.org/), hoặc chuyển đổi các bảng kiểu CSS của bạn bằng [PostCSS](https://postcss.org/).

## Xử lý phụ thuộc

Tất cả các framework lớn đều cung cấp các cơ chế để xử lý phụ thuộc — sử dụng các thành phần bên trong các thành phần khác, đôi khi với nhiều cấp độ phân cấp. Giống như các tính năng khác, cơ chế chính xác sẽ khác nhau giữa các framework, nhưng kết quả cuối cùng là như nhau. Các thành phần có xu hướng nhập các thành phần vào các thành phần khác bằng cú pháp [mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules) tiêu chuẩn, hoặc ít nhất là thứ gì đó tương tự.

### Thành phần trong thành phần

Một lợi ích chính của kiến trúc giao diện người dùng dựa trên thành phần là các thành phần có thể được kết hợp với nhau. Giống như bạn có thể viết các thẻ HTML bên trong nhau để xây dựng một trang web, bạn có thể sử dụng các thành phần bên trong các thành phần khác để xây dựng một ứng dụng web. Mỗi framework cho phép bạn viết các thành phần sử dụng (và do đó phụ thuộc vào) các thành phần khác.

Ví dụ, thành phần `AuthorCredit` React của chúng ta có thể được sử dụng bên trong thành phần `Article`. Điều đó có nghĩa là `Article` sẽ cần nhập `AuthorCredit`.

```js
import AuthorCredit from "./components/AuthorCredit";
```

Sau khi đó được thực hiện, `AuthorCredit` có thể được sử dụng bên trong thành phần `Article` như thế này:

```jsx
<Article>
  <AuthorCredit />
</Article>
```

### Tiêm phụ thuộc

Các ứng dụng trong thế giới thực thường liên quan đến các cấu trúc thành phần với nhiều cấp độ lồng nhau. Một thành phần `AuthorCredit` lồng nhiều cấp sâu có thể, vì một lý do nào đó, cần dữ liệu từ cấp gốc của ứng dụng.

Giả sử rằng trang web tạp chí mà chúng ta đang xây dựng được cấu trúc như thế này:

```jsx
<App>
  <Home>
    <Article>
      <AuthorCredit {/* props */} />
    </Article>
  </Home>
</App>
```

Thành phần `App` của chúng ta có dữ liệu mà thành phần `AuthorCredit` của chúng ta cần. Chúng ta có thể viết lại `Home` và `Article` để chúng biết truyền props xuống, nhưng điều này có thể tẻ nhạt nếu có nhiều, rất nhiều cấp độ giữa nguồn gốc và đích đến của dữ liệu. Điều này cũng quá mức: `Home` và `Article` thực ra không sử dụng ảnh chân dung hay dòng giới thiệu của tác giả, nhưng nếu chúng ta muốn đưa thông tin đó vào `AuthorCredit`, chúng ta sẽ cần thay đổi `Home` và `Article` để phù hợp với nó.

Vấn đề truyền dữ liệu qua nhiều lớp thành phần được gọi là prop drilling, và không lý tưởng cho các ứng dụng lớn.

Để tránh prop drilling, framework cung cấp chức năng được gọi là tiêm phụ thuộc, đó là cách đưa dữ liệu nhất định trực tiếp đến các thành phần cần nó, mà không cần truyền qua các cấp độ can thiệp. Mỗi framework triển khai tiêm phụ thuộc dưới một tên khác nhau, và theo cách khác nhau, nhưng hiệu quả cuối cùng là như nhau.

Angular gọi quá trình này là [tiêm phụ thuộc](https://angular.dev/guide/di/dependency-injection); Vue có [các phương thức thành phần `provide()` và `inject()`](https://v2.vuejs.org/v2/api/#provide-inject); React có [Context API](https://react.dev/learn/passing-data-deeply-with-context); Ember chia sẻ trạng thái qua [dịch vụ](https://guides.emberjs.com/release/services/).

### Vòng đời

Trong bối cảnh của framework, **vòng đời** của một thành phần là tập hợp các giai đoạn mà thành phần trải qua từ khi nó được thêm vào DOM và sau đó được kết xuất bởi trình duyệt (thường được gọi là _gắn kết_) đến khi nó bị xóa khỏi DOM (thường được gọi là _tháo gỡ_). Mỗi framework đặt tên cho các giai đoạn vòng đời này khác nhau, và không phải tất cả đều cho nhà phát triển truy cập vào các giai đoạn giống nhau. Tất cả các framework đều tuân theo mô hình chung: chúng cho phép nhà phát triển thực hiện một số hành động nhất định khi thành phần _gắn kết_, khi nó _kết xuất_, khi nó _tháo gỡ_, và tại nhiều giai đoạn giữa những điều này.

Giai đoạn _kết xuất_ là quan trọng nhất để hiểu, vì nó được lặp lại nhiều lần nhất khi người dùng tương tác với ứng dụng của bạn. Nó được chạy mỗi khi trình duyệt cần kết xuất thứ gì đó mới, cho dù thông tin mới đó là bổ sung vào những gì trong trình duyệt, xóa, hay chỉnh sửa những gì ở đó.

[Sơ đồ vòng đời thành phần React](https://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/) này cung cấp tổng quan chung về khái niệm.

## Kết xuất phần tử

Giống như với vòng đời, framework có cách tiếp cận khác nhau nhưng tương tự nhau về cách chúng kết xuất ứng dụng của bạn. Tất cả chúng đều theo dõi phiên bản kết xuất hiện tại của DOM trình duyệt của bạn, và mỗi cái đưa ra quyết định hơi khác nhau về cách DOM nên thay đổi khi các thành phần trong ứng dụng của bạn kết xuất lại. Vì framework đưa ra những quyết định này cho bạn, bạn thường không tự tương tác với DOM. Sự trừu tượng hóa này từ DOM phức tạp hơn và tốn bộ nhớ nhiều hơn so với tự cập nhật DOM, nhưng nếu không có nó, framework không thể cho phép bạn lập trình theo cách khai báo mà chúng nổi tiếng.

**DOM ảo** là cách tiếp cận trong đó thông tin về DOM của trình duyệt được lưu trữ trong bộ nhớ JavaScript. Ứng dụng của bạn cập nhật bản sao DOM này, sau đó so sánh nó với DOM "thực" — DOM thực sự được kết xuất cho người dùng của bạn — để quyết định những gì cần kết xuất. Ứng dụng xây dựng một "diff" để so sánh sự khác biệt giữa DOM ảo đã cập nhật và DOM hiện đang được kết xuất, và sử dụng diff đó để áp dụng các cập nhật cho DOM thực. Cả React và Vue đều sử dụng mô hình DOM ảo, nhưng chúng không áp dụng logic chính xác giống nhau khi diffing hoặc kết xuất.

Bạn có thể [đọc thêm về DOM ảo trong tài liệu React](https://legacy.reactjs.org/docs/faq-internals.html#what-is-the-virtual-dom).

**DOM tăng dần** tương tự như DOM ảo ở chỗ nó xây dựng DOM diff để quyết định những gì cần kết xuất, nhưng khác ở chỗ nó không tạo ra một bản sao đầy đủ của DOM trong bộ nhớ JavaScript. Nó bỏ qua các phần của DOM không cần thay đổi. Angular là framework duy nhất được thảo luận cho đến nay trong module này sử dụng DOM tăng dần.

Bạn có thể [đọc thêm về DOM tăng dần trên blog Auth0](https://auth0.com/blog/incremental-dom/).

**Glimmer VM** là đặc trưng của Ember. Nó không phải là DOM ảo hay DOM tăng dần; đó là một quá trình riêng biệt qua đó các mẫu Ember được dịch mã thành một loại "byte code" dễ đọc và nhanh hơn JavaScript.

## Định tuyến

Như [đã đề cập trong chương trước, định tuyến](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Introduction#routing) là một phần quan trọng của trải nghiệm web. Để tránh trải nghiệm bị gián đoạn trong các ứng dụng đủ phức tạp với nhiều view, mỗi framework được đề cập trong module này cung cấp một thư viện (hoặc nhiều hơn một thư viện) giúp các nhà phát triển triển khai định tuyến phía client trong ứng dụng của họ.

## Kiểm thử

Tất cả các ứng dụng được hưởng lợi từ độ bao phủ kiểm thử đảm bảo phần mềm của bạn tiếp tục hoạt động theo cách bạn mong đợi, và các ứng dụng web cũng không khác. Hệ sinh thái của mỗi framework cung cấp công cụ tạo điều kiện cho việc viết kiểm thử. Các công cụ kiểm thử không được tích hợp vào bản thân các framework, nhưng các công cụ giao diện dòng lệnh được sử dụng để tạo ứng dụng framework cho bạn quyền truy cập vào các công cụ kiểm thử phù hợp.

Mỗi framework có các công cụ mở rộng trong hệ sinh thái của nó, với khả năng kiểm thử đơn vị và kiểm thử tích hợp.

[Testing Library](https://testing-library.com/) là một bộ tiện ích kiểm thử có các công cụ cho nhiều môi trường JavaScript, bao gồm React, Vue và Angular. Tài liệu Ember đề cập đến [kiểm thử các ứng dụng Ember](https://guides.emberjs.com/release/testing/).

Đây là một bài kiểm thử nhanh cho `CounterButton` của chúng ta được viết với sự trợ giúp của React Testing Library — nó kiểm thử một số thứ, chẳng hạn như sự tồn tại của nút, và liệu nút có hiển thị văn bản đúng sau khi được nhấp 0, 1 và 2 lần:

```jsx
import { fireEvent, render, screen } from "@testing-library/react";

import CounterButton from "./CounterButton";

it("Renders a semantic button with an initial state of 0", () => {
  render(<CounterButton />);
  const btn = screen.getByRole("button");

  expect(btn).toBeInTheDocument();
  expect(btn).toHaveTextContent("Clicked 0 times");
});

it("Increments the count when clicked", () => {
  render(<CounterButton />);
  const btn = screen.getByRole("button");

  fireEvent.click(btn);
  expect(btn).toHaveTextContent("Clicked 1 times");

  fireEvent.click(btn);
  expect(btn).toHaveTextContent("Clicked 2 times");
});
```

## Tóm tắt

Tại thời điểm này, bạn nên có thêm ý tưởng về các ngôn ngữ, tính năng và công cụ thực tế mà bạn sẽ sử dụng khi tạo ứng dụng với framework. Tôi chắc chắn bạn nhiệt tình muốn bắt đầu và thực sự làm một số lập trình, và đó là những gì bạn sẽ làm tiếp theo!

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Introduction","Learn_web_development/Core/Frameworks_libraries/React_getting_started", "Learn_web_development/Core/Frameworks_libraries")}}
