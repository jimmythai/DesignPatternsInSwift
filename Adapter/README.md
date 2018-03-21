# Adapter

## Summary

Adapter is a structural pattern that changes the interface of a class into another interface which is compatible with the client.
There are two ways to create Adapter pattern. One is object adapter, which uses composition and can wrap classes or interfaces, or both.
Another is class adapter, which uses multiple inheritance to connect target and adaptee, and only can wrap a class. The latter one uses inheritance which exposes a subclass to details of its parent's implementation, it's often said that 'inheritance breaks encapsulations'.

## Pros & Cons

### Pros

- Hides from the client code unnecessary implementation details of interface & data conversion.

### Cons

- Increases overall code complexity by creating additional classes.