class SvgElement
  constructor: (@element) ->
    @initializeAttributes()

  initializeAttributes: ->
    @attrs.forEach this.initalizeAttribute.bind this

  initalizeAttribute: (name) ->
    @[name] = ->
      console.log "this should set #{name}"

class Circle extends SvgElement
  attrs: [
    'cx'
    'cy'
    'r'
  ]

element = null;
circle = new Circle(element);

# or maybe use getter/setter? = easier syntax
circle.cx('test');
circle.cy('test');
circle.r('test');

###
problems:

Circle gets all those functions generated from attributes during runtime
which does not make much sense. Probably should do sth like:

Circle = ElementFactory(
  attrs: ...
)

which will generate appropriate Circle class
###
