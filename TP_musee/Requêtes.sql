Listez les événements dont la description longue à plus de 200 caractères 

SELECT id_evenement, titre, description_longue
FROM public.evenement
WHERE LENGTH (description_longue) > 200;


Comptez les événements ayant une accessibilité qualifiée

SELECT COUNT(DISTINCT public.evenement.id_evenement) AS nb_evenements_accessibles
FROM public.evenement
JOIN public.avoir ON public.evenement.id_evenement = public.avoir.id_evenement;



Donnez le classement des communes par nombre d’événements

SELECT public.territoire.ville, COUNT(DISTINCT public.evenement.id_evenement) AS nb_evenements
FROM public.evenement
JOIN public.derouler ON public.evenement.id_evenement = public.derouler.id_evenement
JOIN public.lieu ON public.derouler.id_lieu = public.lieu.id_lieu
JOIN public.territoire  ON public.lieu.id_territoire = public.territoire.id_territoire
GROUP BY public.territoire.ville
ORDER BY nb_evenements DESC;



Cherchez les événements contenant le mot-clé “enfant”

SELECT id_evenement, titre, mots_cles
FROM public.evenement
WHERE mots_cles LIKE '%enfant%';



Trouvez les 5 communes ayant le plus grand nombre de lieux culturels

SELECT public.territoire.ville, COUNT(public.lieu.id_lieu) AS nb_lieux
FROM public.lieu
JOIN public.territoire ON public.lieu.id_territoire = public.territoire.id_territoire
GROUP BY public.territoire.ville
ORDER BY nb_lieux DESC
LIMIT 5;



Donnez le nombre d’événements par commune

SELECT public.territoire.ville, COUNT(DISTINCT public.evenement.id_evenement) AS nb_evenements
FROM public.evenement
JOIN public.derouler  ON public.evenement.id_evenement = public.derouler.id_evenement
JOIN public.lieu  ON public.derouler.id_lieu = public.lieu.id_lieu
JOIN public.territoire ON public.lieu.id_territoire = public.territoire.id_territoire
GROUP BY public.territoire.ville
ORDER BY nb_evenements DESC;



Affichez les événements par région

SELECT public.territoire.region, COUNT(DISTINCT public.evenement.id_evenement) AS nb_evenements
FROM public.evenement
JOIN public.derouler  ON public.evenement.id_evenement = public.derouler.id_evenement
JOIN public.lieu ON public.derouler.id_lieu = public.lieu.id_lieu
JOIN public.territoire  ON public.lieu.id_territoire = public.territoire.id_territoire
GROUP BY public.territoire.region
ORDER BY nb_evenements DESC;




Listez tous les événements avec leur lieu

SELECT public.evenement.id_evenement, public.evenement.titre, public.lieu.nom_lieu, public.lieu.adresse_lieu
FROM public.evenement
JOIN public.derouler  ON public.evenement.id_evenement = public.derouler.id_evenement
JOIN public.lieu ON public.derouler.id_lieu = public.lieu.id_lieu
ORDER BY public.evenement.id_evenement;



Affichez tous les lieux situés dans une ville donnée

SELECT public.lieu.id_lieu, public.lieu.nom_lieu, public.lieu.adresse_lieu, public.territoire.ville
FROM public.lieu
JOIN public.territoire ON public.lieu.id_territoire = public.territoire.id_territoire
WHERE public.territoire.ville = 'Valence'
ORDER BY public.lieu.nom_lieu;


Trouvez tous les événements avec un âge minimum

SELECT id_evenement, titre, details_conditions
FROM public.evenement
WHERE details_conditions IS NOT NULL
  AND details_conditions LIKE '%âge minimum%';


