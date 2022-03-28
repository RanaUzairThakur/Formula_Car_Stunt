using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OffFade : MonoBehaviour
{
    public GameObject Fade;
    private void OnEnable()
    {
        StartCoroutine(off());

    }

   IEnumerator off()
    {
        yield return new WaitForSeconds(2f);
        Fade.SetActive(false);
        StopAllCoroutines();
    }
}
