/*
 * force dev to add a dispose method
 * One small caveat that needs to be kept in mind with streams 
 * is that they need to be closed when they are no longer needed, 
 * otherwise it can cause a memory leak.
 */

abstract class Bloc {
  void dispose();
}