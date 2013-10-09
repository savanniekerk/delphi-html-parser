{
  Html解析器.
  最近因为用到Html解析功能.在网上找了几款Delphi版本的,结果发现解析复杂的HTML都有一些问题.
  没办法自己写了一款,经测试到现在没遇到任何解析不了的Html.

  wr960204 武稀松 2013

  http://www.raysoftware.cn/?p=370

  感谢牛人杨延哲在HTML语法和CSS语法方面的帮助.
  Thank Yang Yanzhe.

  http://www.pockhero.com/

}
unit HtmlParser_XE3UP;

interface

uses
  SysUtils, generics.Collections;

type
{$IFNDEF MSWINDOWS}
  WideString = String;
{$ENDIF}
  IHtmlElement = interface;
  IHtmlElementList = interface;
  TEnumAttributeNameCallBack = function(AParam: Pointer;
    const AttributeName, AttributeValue: WideString): Boolean; stdcall;
  TFilterElementCallBack = function(AParam: Pointer; AElement: IHtmlElement)
    : Boolean; stdcall;

  IHtmlElement = interface
    ['{8C75239C-8CFA-499F-B115-7CEBEDFB421B}']
    function GetOwner: IHtmlElement; stdcall;
    function GetTagName: WideString; safecall;
    function GetContent: WideString; safecall;
    function GetOrignal: WideString; safecall;
    function GetChildrenCount: Integer; stdcall;
    function GetChildren(Index: Integer): IHtmlElement; stdcall;
    function GetCloseTag: IHtmlElement; stdcall;
    function GetInnerHtml(): WideString; safecall;
    function GetOuterHtml(): WideString; safecall;
    function GetInnerText(): WideString; safecall;

    function GetAttributes(Key: WideString): WideString; safecall;

    function GetSourceLineNum(): Integer; stdcall;
    function GetSourceColNum(): Integer; stdcall;

    // 属性是否存在
    function HasAttribute(AttributeName: WideString): Boolean; stdcall;
    // 查找节点
    { FindElements('Link','type="application/rss+xml"')
      FindElements('','type="application/rss+xml"')
    }
    function FindElements(ATagName: WideString; AAttributes: WideString;
      AOnlyInTopElement: Boolean): IHtmlElementList; stdcall;
    { 用CSS选择器语法查找Element,不支持"伪类"
      CSS Selector Style search,not support Pseudo-classes.

      http://www.w3.org/TR/CSS2/selector.html
    }
    function SimpleCSSSelector(const selector: WideString)
      : IHtmlElementList; stdcall;
    // 枚举属性
    procedure EnumAttributeNames(AParam: Pointer;
      ACallBack: TEnumAttributeNameCallBack); stdcall;

    property TagName: WideString read GetTagName;
    property ChildrenCount: Integer read GetChildrenCount;
    property Children[index: Integer]: IHtmlElement read GetChildren; default;
    property CloseTag: IHtmlElement read GetCloseTag;
    property Content: WideString read GetContent;
    property Orignal: WideString read GetOrignal;
    property Owner: IHtmlElement read GetOwner;
    // 获取元素在源代码中的位置
    property SourceLineNum: Integer read GetSourceLineNum;
    property SourceColNum: Integer read GetSourceColNum;
    //
    property InnerHtml: WideString read GetInnerHtml;
    property OuterHtml: WideString read GetOuterHtml;
    property InnerText: WideString read GetInnerText;

    property Attributes[Key: WideString]: WideString read GetAttributes;
  end;

  IHtmlElementList = interface
    ['{8E1380C6-4263-4BF6-8D10-091A86D8E7D9}']
    function GetCount: Integer; stdcall;
    function GetItems(Index: Integer): IHtmlElement; stdcall;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: IHtmlElement read GetItems; default;
  end;

function ParserHTML(const Source: WideString): IHtmlElement; stdcall;

implementation

function ParserHTML(const Source: WideString): IHtmlElement; stdcall;
begin

end;

end.
