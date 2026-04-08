---
title: HTML lang global attribute
short-title: lang
slug: Web/HTML/Reference/Global_attributes/lang
page-type: html-attribute
browser-compat: html.global_attributes.lang
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`lang`** giúp xác định ngôn ngữ của một phần tử: ngôn ngữ mà các phần tử không thể chỉnh sửa được viết bằng, hoặc ngôn ngữ mà các phần tử có thể chỉnh sửa nên được người dùng viết bằng. Thuộc tính chứa một {{glossary("BCP 47 language tag")}} duy nhất.

> [!NOTE]
> Nếu giá trị của `lang` được đặt thành chuỗi rỗng, ngôn ngữ được xác định là hoàn toàn không xác định. Do đó, nên luôn chỉ định một giá trị phù hợp cho thuộc tính này.

{{InteractiveExample("HTML Demo: lang", "tabbed-shorter")}}

```html interactive-example
<p>This paragraph is English, but the language is not specifically defined.</p>

<p lang="en-GB">This paragraph is defined as British English.</p>

<p lang="fr">Ce paragraphe est défini en français.</p>
```

```css interactive-example
p::before {
  padding-right: 5px;
}

[lang="en-GB"]::before {
  content: "(In British English) ";
}

[lang="fr"]::before {
  content: "(In French) ";
}
```

Nếu giá trị thuộc tính là _chuỗi rỗng_ (`lang=""`), ngôn ngữ được đặt là _không xác định_; nếu thẻ ngôn ngữ không hợp lệ theo BCP47, ngôn ngữ được đặt là _không hợp lệ_.

Ngay cả khi thuộc tính `lang` được đặt, nó có thể không được tính đến, vì thuộc tính `xml:lang` có ưu tiên cao hơn.

Đối với lớp giả CSS {{cssxref(":lang")}}, hai tên ngôn ngữ không hợp lệ là khác nhau nếu tên của chúng khác nhau. Vì vậy, trong khi `:lang(es)` khớp cả `lang="es-ES"` và `lang="es-419"`, `:lang(xyzzy)` sẽ _không_ khớp với `lang="xyzzy-Zorp!"`.

## Vấn đề trợ năng

Tiêu chí thành công WCAG 3.1.1 **yêu cầu** rằng ngôn ngữ của trang được chỉ định theo cách có thể 'xác định theo chương trình' (tức là thông qua thuộc tính **`lang`**).

Tiêu chí thành công WCAG 3.1.2 yêu cầu rằng các trang có **các phần** bằng các ngôn ngữ khác nhau cũng phải chỉ định ngôn ngữ của những phần đó. Một lần nữa, thuộc tính **`lang`** là cơ chế đúng đắn cho điều này.

Mục đích của các yêu cầu này chủ yếu là để cho phép các công nghệ hỗ trợ như trình đọc màn hình gọi đúng cách phát âm.

Ví dụ, menu ngôn ngữ trên trang web này (MDN) bao gồm thuộc tính **`lang`** cho mỗi mục:

```html
<div class="dropdown-container language-menu">
  <button
    id="header-language-menu"
    type="button"
    class="dropdown-menu-label"
    aria-haspopup="true"
    aria-owns="language-menu"
    aria-label="Current language is English. Choose your preferred language.">
    English
    <span class="dropdown-arrow-down" aria-hidden="true">▼</span>
  </button>
  <ul
    id="language-menu"
    class="dropdown-menu-items right show"
    aria-expanded="true"
    role="menu">
    <li role="menuitem">
      <a
        href="/ca/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Catalan">
        <bdi lang="ca">Català</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/de/docs/Web/HTML/Reference/Global_attributes/lang"
        title="German">
        <bdi lang="de">Deutsch</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/es/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Spanish">
        <bdi lang="es">Español</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/fr/docs/Web/HTML/Reference/Global_attributes/lang"
        title="French">
        <bdi lang="fr">Français</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/ja/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Japanese">
        <bdi lang="ja">日本語</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/ko/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Korean">
        <bdi lang="ko">한국어</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/pt-BR/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Portuguese (Brazilian)">
        <bdi lang="pt-BR">Português (do&nbsp;Brasil)</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/ru/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Russian">
        <bdi lang="ru">Русский</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/uk/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Ukrainian">
        <bdi lang="uk">Українська</bdi>
      </a>
    </li>
    <li role="menuitem">
      <a
        href="/zh-CN/docs/Web/HTML/Reference/Global_attributes/lang"
        title="Chinese (Simplified)">
        <bdi lang="zh-Hans">中文 (简体)</bdi>
      </a>
    </li>
    <li>
      <a
        href="/en-US/docs/Web/HTML/Reference/Global_attributes/lang"
        rel="nofollow"
        id="translations-add">
        Add a translation
      </a>
    </li>
  </ul>
</div>
```

## Kế thừa

Nếu một phần tử không có thuộc tính `lang`, nó sẽ kế thừa giá trị `lang` được đặt trên [nút cha](/en-US/docs/Glossary/Node/DOM) của nó, mà lần lượt có thể kế thừa nó từ cha của nó, và cứ thế tiếp tục.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- [HTTP Header `Content-Language`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Language)
- Thuộc tính HTML [`translate`](/en-US/docs/Web/HTML/Reference/Global_attributes/translate)
